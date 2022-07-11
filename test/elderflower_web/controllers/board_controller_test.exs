defmodule ElderflowerWeb.BoardControllerTest do
  use ElderflowerWeb.ConnCase

  alias Elderflower.Server

  @create_attrs %{body: "some board contents", public_key: "some board key" }

  def fixture(:post) do
    {:ok, post} = Server.update_board(@create_attrs)
    post
  end

  describe "show" do
    test "returns a board", %{conn: conn} do
      board = fixture(:post)
      conn = get(conn, Routes.board_path(conn, :show, "lupus"))
      assert html_response(conn, 200) == board.body
    end
  end

  describe "update" do
    test "accepts requests to update a board", %{conn: conn} do
      put(conn, Routes.board_path(conn, :update, "lupus"))
    end
  end
end
