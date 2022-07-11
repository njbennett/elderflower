defmodule Elderflower.Server.Board do
  use Ecto.Schema
  import Ecto.Changeset

  schema "boards" do
    field :content, :string
    field :key, :string

    timestamps()
  end

  @doc false
  def changeset(board, attrs) do
    board
    |> cast(attrs, [:key, :content])
    |> validate_required([:key, :content])
  end
end
