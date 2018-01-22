defmodule BlockApi.BlockController do
  use BlockApi.Web, :controller

  alias BlockApi.Block

  def create(conn, %{"data" => data}) do
    GenServer.call(BlockApi.BlockProcessor, data)
    send_resp(conn, 202, "")
  end

  def show(conn, %{"id" => limit}) do
    render(conn, "show.json", collection: collection(limit))
  end

  defp collection(limit) do
    Block
    |> Block.latest_elements(limit)
    |> Repo.all
  end
end
