defmodule CheetahTest do
  use ExUnit.Case
  doctest Cheetah

  test "greets the world" do
    assert Cheetah.hello() == :world
  end
end
