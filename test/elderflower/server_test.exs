defmodule Elderflower.ServerTest do
  use Elderflower.DataCase

  alias Elderflower.Server

  describe "boards" do
    alias Elderflower.Server.Board

    import Elderflower.ServerFixtures

    @invalid_attrs %{content: nil, key: nil}

    test "list_boards/0 returns all boards" do
      board = board_fixture()
      assert Server.list_boards() == [board]
    end

    test "get_board!/1 returns the board with given id" do
      board = board_fixture()
      assert Server.get_board!(board.id) == board
    end

    test "get_board_by_key/1 returns the board with given id" do
      board = board_fixture()
      assert Server.get_board_by_key(board.key) == board
    end

    test "get_board_by_key/1 works even when the board doesn't exist" do
      Server.get_board_by_key("some-nonexistent-key")
    end

    test "create_board/1 with valid data creates a board" do
      valid_attrs = %{content: "some content", key: "some key"}

      assert {:ok, %Board{} = board} = Server.create_board(valid_attrs)
      assert board.content == "some content"
      assert board.key == "some key"
    end

    test "create_board/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Server.create_board(@invalid_attrs)
    end

    test "update_board/2 with valid data updates the board" do
      board = board_fixture()
      update_attrs = %{content: "some updated content", key: "some updated key"}

      assert {:ok, %Board{} = board} = Server.update_board(board, update_attrs)
      assert board.content == "some updated content"
      assert board.key == "some updated key"
    end

    test "update_board/2 with invalid data returns error changeset" do
      board = board_fixture()
      assert {:error, %Ecto.Changeset{}} = Server.update_board(board, @invalid_attrs)
      assert board == Server.get_board!(board.id)
    end

    test "delete_board/1 deletes the board" do
      board = board_fixture()
      assert {:ok, %Board{}} = Server.delete_board(board)
      assert_raise Ecto.NoResultsError, fn -> Server.get_board!(board.id) end
    end

    test "change_board/1 returns a board changeset" do
      board = board_fixture()
      assert %Ecto.Changeset{} = Server.change_board(board)
    end
  end
end
