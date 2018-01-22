defmodule BlockApi.BlockCreator do
  use GenServer

  alias BlockApi.Block
  alias BlockApi.Repo
  alias BlockApi.Hasher

  @spec start_link() :: {:ok, pid}
  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @doc """
  Initiates state with a hash of the latest block or "0".
  """
  @spec init(args :: term()) :: {:ok, String.t}
  def init(_args) do
    {:ok, init_block_hash()}
  end

  @doc """
  Saves block to the DB with hashed fields:
    - previous_block_hash (SHA256 generated string);
    - block_hash (SHA256 generated string);
    - timestamp (NaiveDateTime);
    - rows (List of String elements).

  State is being updated with newly generated block_hash.
  """
  @spec handle_cast(list, list) :: {:noreply, list}
  def handle_cast(request, state) do
    {:noreply, create_block(request, state)}
  end

  defp create_block(request, previous_block_hash) do
    request
    |> prepare_dataset(previous_block_hash)
    |> store
    |> Map.get(:block_hash)
  end

  defp prepare_dataset(rows, previous_block_hash) do
    prepare_dataset(rows, previous_block_hash, NaiveDateTime.utc_now())
  end

  defp prepare_dataset(rows, previous_block_hash, timestamp) do
    %{
      previous_block_hash: previous_block_hash,
      block_hash: Hasher.sha256([Hasher.merkle_root(rows), previous_block_hash, Hasher.sha256(timestamp)]),
      timestamp: timestamp,
      rows: rows
    }
  end

  defp store(data) do
    %Block{}
    |> Block.changeset(data)
    |> Repo.insert!
  end

  defp init_block_hash do
    Block
    |> Block.latest_elements
    |> Repo.one
    |> latest_block_hash
  end

  defp latest_block_hash(nil), do: "0"
  defp latest_block_hash(block), do: block.block_hash
end
