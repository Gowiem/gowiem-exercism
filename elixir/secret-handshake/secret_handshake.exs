defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    if code >= 32 do
      []
    else
      binary = Integer.to_string(code, 2) |> String.codepoints
      count = Enum.count(binary)

      result = binary
      |> Enum.with_index
      |> Enum.reduce(%{ reverse: false, result: [] }, fn({num, idx}, memo) ->
        cond do
          num == "1" && (count - idx == 5) ->
            Map.put(memo, :reverse, true)
          num == "1" ->
            Map.put(memo, :result, memo[:result] ++ translate(count - idx))
          true ->
            memo
        end
      end)

      # Confusing because I reverse if false... but that's the way this turned out.
      # Happy for suggestions here. Start with reverse = true? and negate on 10000?
      if result[:reverse] do
        result[:result]
      else
        result[:result] |> Enum.reverse
      end
    end
  end

  def translate(1), do: ["wink"]
  def translate(2), do: ["double blink"]
  def translate(3), do: ["close your eyes"]
  def translate(4), do: ["jump"]
end
