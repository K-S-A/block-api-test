defmodule BlockApi.Block do
  use BlockApi.Web, :model

  schema "blocks" do
    field :previous_block_hash, :string
    field :rows, {:array, :string}
    field :timestamp, :naive_datetime
    field :block_hash, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:previous_block_hash, :rows, :timestamp, :block_hash])
    |> validate_required([:previous_block_hash, :rows, :timestamp, :block_hash])
  end

  @doc """
  Returns n latest records.
  """
  @spec latest_elements(Block.t, Integer.t) :: list
  def latest_elements(query), do: latest_elements(query, 1)
  def latest_elements(query, limit) do
    query
    |> order_by(desc: :timestamp)
    |> limit(^limit)
  end
end
