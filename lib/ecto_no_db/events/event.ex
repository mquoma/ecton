defmodule EctoNoDb.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field(:name, :string)
    field(:city, :string)
    field(:start, :date)
    field(:end, :date)

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [])
    |> validate_required([])
  end
end
