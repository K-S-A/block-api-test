defmodule BlockApi.BlockTest do
  use BlockApi.ModelCase

  alias BlockApi.Block

  @valid_attrs %{block_hash: "some content", previous_block_hash: "some content", rows: ["row"], timestamp: NaiveDateTime.utc_now}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Block.changeset(%Block{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Block.changeset(%Block{}, @invalid_attrs)
    refute changeset.valid?
  end
end
