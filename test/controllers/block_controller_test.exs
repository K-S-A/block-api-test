defmodule BlockApi.BlockControllerTest do
  use BlockApi.ConnCase

  alias BlockApi.Block
  @valid_attrs %{data: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "renders page when limit is zero", %{conn: conn} do
    conn = get conn, block_path(conn, :show, 0)
    assert json_response(conn, 200)
  end

  test "responds with 202 status when data is valid", %{conn: conn} do
    conn = post conn, block_path(conn, :create), @valid_attrs
    assert response(conn, 202)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, block_path(conn, :create), block: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end
end
