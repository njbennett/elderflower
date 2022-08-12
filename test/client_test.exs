defmodule ClientTest do
  use ExUnit.Case, async: true
  doctest Elderflower.Client

  test "generates a keypair" do
    ends_with_a? = fn(a) -> String.match?(a, ~r/a$/) end
    { private_key, _public_key } = Elderflower.Client.keypair(ends_with_a?)
    assert ends_with_a?.(private_key)
  end

  test "requests a board" do
    { :ok, board } = Elderflower.Client.get("http://localhost:4000/ca93846ae61903a862d44727c16fed4b80c0522cab5e5b8b54763068b83e0623")
    assert String.contains?(board, "")
  end

  test "it returns an error when it tries to use a key that doesn't exist" do
    local_path = "some-bad-local-path"
    payload = "some html or whatever"
    server_path = "http://localhost:4000/ca93846ae61903a862d44727c16fed4b80c0522cab5e5b8b54763068b83e0623"
    { :error, :enoent } = Elderflower.Client.put(server_path, local_path, payload)
  end

end
