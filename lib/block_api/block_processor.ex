defmodule BlockApi.BlockProcessor do
  use GenServer

  @block_max_rows Application.get_env(:block_api, :block_max_rows)
  @state_max_rows @block_max_rows - 1

  @spec start_link() :: {:ok, pid}
  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @doc """
  Initiates state with an empty array (rows).
  """
  @spec init(args :: term()) :: {:ok, []}
  def init(_args) do
    {:ok, []}
  end

  @doc """
  Collects up to @block_max_rows elements in the state of the process.
  Saves block to the DB when specified pool size is reached.
  TODO: Probably, values should be uniq? Find out possible issues.
  """
  @spec handle_call(String.t, pid, list) :: {:reply, :ok, list}
  def handle_call(request, _from, state) when length(state) >= @state_max_rows do
    GenServer.cast(BlockApi.BlockCreator, [request | state])
    {:reply, :ok, []}
  end

  def handle_call(request, _from, state) do
    {:reply, :ok, [request | state]}
  end
end
