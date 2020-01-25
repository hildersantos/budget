defmodule Budget.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :name, :string
      add :initial_balance, :integer

      timestamps()
    end

  end
end
