defmodule RotationalCipher do
  @lower_alphabet Enum.to_list(?a .. ?z) |> List.to_string |> String.split("") |> Enum.drop(-1)
  @upper_alphabet Enum.to_list(?A .. ?Z) |> List.to_string |> String.split("") |> Enum.drop(-1)
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    posns = text |> String.codepoints |> Enum.map(&find_posn/1)
    shifted = posns |> Enum.map(&(shift_posn(&1, shift)))
    translated = shifted |> Enum.map(&translate_posn/1)
    Enum.join(translated)
  end

  def find_posn(char) do
    lower_found = Enum.find_index(@lower_alphabet, fn(x) -> "#{char}" == "#{x}" end)
    upper_found = Enum.find_index(@upper_alphabet, fn(x) -> "#{char}" == "#{x}" end)
    cond do
      lower_found != nil ->
        {:lower, lower_found}
      upper_found != nil ->
        {:upper, upper_found}
      true ->
        {:keep, char}
    end
  end

  def shift_posn({:keep, char}, _) do {:keep, char} end
  def shift_posn({type, idx}, shift) do
    { type, rem((idx + shift), 26) }
  end

  def translate_posn(posn) do
    case posn do
      {:lower, idx} ->
        Enum.at(@lower_alphabet, idx)
      {:upper, idx} ->
        Enum.at(@upper_alphabet, idx)
      {:keep, char} ->
        char
    end
  end
end
