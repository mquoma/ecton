defmodule EctoNoDb.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do

      timestamps()
    end

  end
end
