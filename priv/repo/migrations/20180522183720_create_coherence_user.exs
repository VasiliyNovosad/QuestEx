defmodule Quest.Repo.Migrations.CreateCoherenceUser do
  use Ecto.Migration
  def change do
    create table(:users) do

      add :name, :string
      add :email, :string
      add :phone, :string
      add :telegram, :string
      # authenticatable
      add :password_hash, :string
      # recoverable
      add :reset_password_token, :string
      add :reset_password_sent_at, :utc_datetime
      # unlockable_with_token
      add :unlock_token, :string
      # confirmable
      add :confirmation_token, :string
      add :confirmed_at, :utc_datetime
      add :confirmation_sent_at, :utc_datetime
      
      timestamps()
    end
    create unique_index(:users, [:email])

  end
end
