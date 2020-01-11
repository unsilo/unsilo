defmodule Device do
  @moduledoc """
  Documentation for Device.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Device.hello()
      :world

  """
  def cleanup_output({result, _status}) do
    result
    |> String.split("\n")
    |> Enum.each(fn r -> IO.inspect(r) end)
  end

  def cleanup_output(result) when is_binary(result) do
    result
    |> String.split("\n")
    |> Enum.each(fn r -> IO.inspect(r) end)
  end

  def cleanup_output(result) do
    result
    |> to_string
    |> String.split("\n")
    |> Enum.each(fn r -> IO.inspect(r) end)
  end
end
