defmodule BlockApi.Hasher do
  use Merkle, &Merkle.Mixers.Bin.sha256/2

  @doc """
  Returns Merkle root for the tree with provided "leafs" (rows).
  """
  @spec merkle_root(list) :: String.t
  def merkle_root(rows) do
    rows
    |> Enum.reduce(new!(), fn(row, acc) ->
      push(acc, sha256(row))
      acc
    end)
    |> close
  end

  @doc """
  Returns SHA256 hash for given element (NaiveDateTime.t or String.t).
  """
  @spec sha256(list | NaiveDateTime.t | String.t) :: String.t
  def sha256(element) when is_list(element) do
    element
    |> Enum.join
    |> sha256
  end

  def sha256(%NaiveDateTime{} = element) do
    element
    |> NaiveDateTime.to_iso8601
    |> sha256
  end

  def sha256(element) do
    :crypto.hash(:sha256, element)
    |> Base.encode16(case: :lower)
  end
end
