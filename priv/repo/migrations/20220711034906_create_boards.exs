defmodule Elderflower.Repo.Migrations.CreateBoards do
  use Ecto.Migration

  def change do
    create table(:boards) do
      add :key, :string
      add :content, :string

      timestamps()
    end
  end
end
