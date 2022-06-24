defmodule S83ServerTest do
  use ExUnit.Case
  doctest S83Server

  test "greets the world" do
    assert S83Server.hello() == :world
  end
end
