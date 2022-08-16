defmodule ElderflowerWeb.BoardControllerTest do
  use ElderflowerWeb.ConnCase

  alias Elderflower.Server

  @create_attrs %{content: "some board contents", key: "some board key"}
  @other_create_attrs %{content: "some other board contents", key: "some board key"}

  def fixture(:board) do
    {:ok, board} = Server.create_board(@create_attrs)
    board
  end

  def fixture(:other_board) do
    {:ok, board} = Server.create_board(@other_create_attrs)
    board
  end

  describe "show" do
    test "returns a board", %{conn: conn} do
      board = fixture(:board)
      conn = get(conn, Routes.board_path(conn, :show, board.key))
      assert html_response(conn, 200) == board.content
    end

    test "returns different boards", %{conn: conn} do
      board = fixture(:other_board)
      conn = get(conn, Routes.board_path(conn, :show, board.key))
      assert html_response(conn, 200) == board.content
    end
  end

  describe "update" do
    test "accepts requests to update a board", %{conn: conn} do
      put(conn, Routes.board_path(conn, :update, "lupus"))
    end
  end
end
