defmodule ClientTest do
  use ExUnit.Case
  doctest Client.CLI

  test "greets the world" do
    assert Client.CLI.hello() == :world
  end
end
