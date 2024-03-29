defmodule Elderflower.Client do
  import Ed25519

  def keypair(check, parent) do
    send(parent, { :key_gen, :status, "." })

    key_pair_list =
      Stream.repeatedly(fn -> 0 end)
      |> Task.async_stream(fn _ -> generate_key_pair() end)
      |> Stream.map(fn {_ok, keypair} -> as_strings(keypair) end)
      |> Stream.filter(fn keypair -> check.(hd(keypair)) end)
      |> Enum.take(1)
      |> Enum.to_list()


    [key_pair | _] = key_pair_list
    List.to_tuple(key_pair)
  end

  defp as_strings(keypair) do
    keypair
    |> Tuple.to_list()
    |> Enum.map(fn a -> Base.encode16(a) end)
    |> Enum.map(fn a -> String.downcase(a) end)
  end

  def get(board_location) do
    %{body: body} = HTTPoison.get!(board_location)
    {:ok, body}
  end

  def put(board_location, path_to_keypair, payload) do
    {ok, result} = File.read(Path.expand(path_to_keypair))

    if ok == :ok do
      keypair = result
      private_key = String.slice(keypair, 0..63) |> String.upcase() |> Base.decode16!()
      public_key = String.slice(keypair, 64..128) |> String.upcase() |> Base.decode16!()

      signature =
        signature(payload, private_key, public_key) |> Base.encode16() |> String.downcase()

      headers = [{"Spring-Version", "83"}, {"Spring-Signature", signature}]
      HTTPoison.put(board_location, payload, headers)
    else
      {ok, result}
    end
  end

  def get_keypair(filepath) do
    {:ok, keypair} = File.read(Path.expand(filepath))
    private_key = String.slice(keypair, 0..63)
    public_key = String.slice(keypair, 64..128)
    {:ok, {private_key, public_key}}
  end

  def put(server, secret, public, payload) do
    signature = signature(payload, secret, public) |> Base.encode16() |> String.downcase()
    headers = [{"Spring-Version", "83"}, {"Spring-Signature", signature}]
    url = "#{server}#{public}"
    HTTPoison.put(url, payload, headers)
  end
end
