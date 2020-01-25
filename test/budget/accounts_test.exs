defmodule Budget.AccountsTest do
  use Budget.DataCase

  alias Budget.Accounts

  describe "accounts" do
    alias Budget.Accounts.Account

    @valid_attrs %{initial_balance: 42000, name: "some name"}
    @update_attrs %{initial_balance: 43000}
    @invalid_attrs %{initial_balance: nil, name: nil}

    def account_fixture(attrs \\ %{}) do
      {:ok, account} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create()

      account
    end

    test "list/0 returns all accounts" do
      account = account_fixture()
      assert Accounts.list() == [account]
    end

    test "get!/1 returns the account with given id" do
      account = account_fixture()
      assert Accounts.get!(account.id) == account
    end

    test "create/1 with valid data creates a account" do
      assert {:ok, %Account{} = account} = Accounts.create(@valid_attrs)
      assert account.initial_balance == 42000
      assert account.name == "some name"
    end

    test "create/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create(@invalid_attrs)
    end

    test "update/2 with valid data updates the account" do
      account = account_fixture()
      assert {:ok, %Account{} = account} = Accounts.update(account, @update_attrs)
      assert account.initial_balance == 43000
      assert account.name == "some name"
    end

    test "update/2 with invalid data returns error changeset" do
      account = account_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update(account, @invalid_attrs)
      assert account == Accounts.get!(account.id)
    end

    test "delete/1 deletes the account" do
      account = account_fixture()
      assert {:ok, %Account{}} = Accounts.delete(account)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get!(account.id) end
    end

    test "change/1 returns a account changeset" do
      account = account_fixture()
      assert %Ecto.Changeset{} = Accounts.change(account)
    end
  end
end
