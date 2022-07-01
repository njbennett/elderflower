defmodule Elderflower.Client do
   import Ed25519

   def get(board_location) do
     %{body: body} = HTTPoison.get!(board_location)
     body
   end

   def put(board_location, path_to_keypair, payload) do

     { _, keypair } = File.read(Path.expand(path_to_keypair))

     private_key = String.slice(keypair, 0..63) |> String.upcase() |> Base.decode16!()
     public_key = String.slice(keypair, 64..128) |> String.upcase() |> Base.decode16!()
     signature = signature(payload, private_key, public_key) |> Base.encode16() |> String.downcase()
     headers = [{"Spring-Version", "83"}, {"Spring-Signature", signature }]
     HTTPoison.put!(board_location, payload, headers)
   end
end
