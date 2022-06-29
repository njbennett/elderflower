defmodule SpecTest do
  use ExUnit.Case, async: true

  test "server responds to OPTIONS" do
    response = HTTPoison.options!("https://bogbody.biz/")
    
    body = response.body()
    status = response.status_code()
    assert body == ""
    assert status == 204
  end
  
  test "OPTIONS returns allowed methods" do
    response = HTTPoison.options!("https://bogbody.biz/")
    headers = response.headers()
    
    { _, methods } = List.keyfind(headers, "Access-Control-Allow-Methods", 0)
    assert methods == "DELETE, GET, OPTIONS, PUT"
  end
end
