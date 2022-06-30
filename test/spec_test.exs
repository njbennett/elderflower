defmodule SpecTest do
  use ExUnit.Case, async: true

  test "server accepts requests to GET a board" do
    response = HTTPoison.get!("http://localhost:4000/ca93846ae61903a862d44727c16fed4b80c0522cab5e5b8b54763068b83e0623")
 
    body = response.body()
    status = response.status_code()
    assert body == ""
    assert status == 200
  end
end
