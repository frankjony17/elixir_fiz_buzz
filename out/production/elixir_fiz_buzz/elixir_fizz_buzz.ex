defmodule ElixirFizzBuzz do
  @moduledoc """
  Documentation for `ElixirFizzBuzz`.
  """

  @doc """
  Read number for file.

  ## Examples

      iex> ElixirFizzBuzz.build()
      {"ok", "1,2,3,....100"}

  """
  def build(file_name), do:
    file_name |> File.read() |> handler_file_read()

  defp handler_file_read({:ok, result}) do
    result = result |> String.split(",") |> Enum.map(&convert_and_evaluate_numbers/1)
    {:ok, result}
  end

  defp handler_file_read({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

  defp convert_and_evaluate_numbers(number) do
    number |> String.to_integer() |> evaluate_numbers()
  end

  defp evaluate_numbers(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :ElixirFizzBuzz
  defp evaluate_numbers(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_numbers(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_numbers(number), do: number
end

ElixirFizzBuzz.build("sdsd.txt")