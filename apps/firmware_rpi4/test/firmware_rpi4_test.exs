defmodule FirmwareRpi4Test do
  use ExUnit.Case
  doctest FirmwareRpi4

  test "greets the world" do
    assert FirmwareRpi4.hello() == :world
  end
end
