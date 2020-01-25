defmodule Budget.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset

  schema "accounts" do
    field :initial_balance, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:name, :initial_balance])
    |> validate_required([:name, :initial_balance])
  end
end
