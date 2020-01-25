defmodule Budget.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Budget.Repo

  alias Budget.Accounts.Account

  @doc """
  Returns the list of accounts.

  ## Examples

      iex> list()
      [%Account{}, ...]

  """
  def list do
    Repo.all(Account)
  end

  @doc """
  Gets a single account.

  Raises `Ecto.NoResultsError` if the Account does not exist.

  ## Examples

      iex> get!(123)
      %Account{}

      iex> get!(456)
      ** (Ecto.NoResultsError)

  """
  def get!(id), do: Repo.get!(Account, id)

  @doc """
  Creates a account.

  ## Examples

      iex> create(%{field: value})
      {:ok, %Account{}}

      iex> create(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create(attrs \\ %{}) do
    %Account{}
    |> Account.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a account.

  ## Examples

      iex> update(account, %{field: new_value})
      {:ok, %Account{}}

      iex> update(account, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update(%Account{} = account, attrs) do
    account
    |> Account.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a account.

  ## Examples

      iex> delete(account)
      {:ok, %Account{}}

      iex> delete(account)
      {:error, %Ecto.Changeset{}}

  """
  def delete(%Account{} = account) do
    Repo.delete(account)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking account changes.

  ## Examples

      iex> change(account)
      %Ecto.Changeset{source: %Account{}}

  """
  def change(%Account{} = account) do
    Account.changeset(account, %{})
  end
end
