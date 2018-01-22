defmodule BlockApi.BlockView do
  use BlockApi.Web, :view

  def render("show.json", %{collection: collection}) do
    render_many(collection, BlockApi.BlockView, "block.json")
  end

  def render("block.json", %{block: block}) do
    %{
      block_hash: block.block_hash,
      previous_block_hash: block.previous_block_hash,
      timestamp: block.timestamp,
      rows: block.rows
    }
  end
end
