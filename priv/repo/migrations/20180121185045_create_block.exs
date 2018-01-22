defmodule BlockApi.Repo.Migrations.CreateBlock do
  use Ecto.Migration

  def change do
    create table(:blocks) do
      add :previous_block_hash, :string, null: false
      add :block_hash, :string, null: false
      add :rows, {:array, :string}, null: false
      add :timestamp, :utc_datetime, null: false

      timestamps()
    end

  end
end
