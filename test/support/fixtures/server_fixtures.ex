defmodule Elderflower.ServerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Elderflower.Server` context.
  """

  @doc """
  Generate a board.
  """
  def board_fixture(attrs \\ %{}) do
    {:ok, board} =
      attrs
      |> Enum.into(%{
        content: "some content",
        key: "some key"
      })
      |> Elderflower.Server.create_board()

    board
  end
end
