defmodule ElixirElixirFizzBuzzTest do
  use ExUnit.Case

  describe "build/1" do
    test "when a valid file is provided, return the converted list" do
      expected_response =  {:ok, [1, 2, :fizz, 4, :buzz, :fizz, :buzz, :fizz, :ElixirFizzBuzz, 17, :buzz, :ElixirFizzBuzz, :buzz]}
      assert ElixirFizzBuzz.build("numbers.txt") == expected_response
    end

    test "when an invalid file is provided, return an error" do
      expected_response =  {:error, "Error reading the file: enoent"}
      assert ElixirFizzBuzz.build("invalid_numbers.txt") == expected_response
    end
  end
end
