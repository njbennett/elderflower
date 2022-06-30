defmodule SpecTest do
  use ExUnit.Case, async: true

  test "server accepts requests to GET a board" do
    assert %{status_code: 200} = HTTPoison.get!("http://localhost:4000/ca93846ae61903a862d44727c16fed4b80c0522cab5e5b8b54763068b83e0623")
  end

  test "server accepts requests to PUT a board" do
    assert %{status_code: 401} = HTTPoison.put!("http://localhost:4000/46b8442a9e23599cb121a435216d2afb3a7748d3794201e30d601540983e0123", "Elderflower")
  end
end
