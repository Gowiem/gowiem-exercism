defmodule ProteinTranslation do
  @translation %{ "UGU" => "Cysteine", "UGC" => "Cysteine", "UUA" => "Leucine", "UUG" => "Leucine", "AUG" => "Methionine", "UUU" => "Phenylalanine", "UUC" => "Phenylalanine", "UCU" => "Serine", "UCC" => "Serine", "UCA" => "Serine", "UCG" => "Serine", "UGG" => "Tryptophan", "UAU" => "Tyrosine", "UAC" => "Tyrosine", "UAA" => "STOP", "UAG" => "STOP", "UGA" => "STOP" }
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
    codons = rna |> String.split("")
                 |> Enum.chunk(3)
                 |> Enum.map(&(Enum.join(&1, "")))
                 |> Enum.map(&of_codon/1)

    if Enum.any?(codons, &(elem(&1, 0) == :error)) do
      { :error, "invalid RNA" }
    else
      result = Enum.reduce_while(codons, [], fn codon, acc ->
        if elem(codon, 1) == "STOP" do
          { :halt, acc }
        else
          { :cont, acc ++ [elem(codon, 1)] }
        end
      end)
      { :ok, result }
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: { atom, String.t() }
  def of_codon(codon) do
    cond do
      Map.has_key?(@translation, codon) ->
        { :ok, @translation[codon] }
      true ->
        { :error, "invalid codon" }
    end
  end
end
