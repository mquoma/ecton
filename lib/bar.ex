defmodule Bar do
  use Ecto.Schema

  embedded_schema do
    field(:a, :integer)
    field(:b, :string)
    field(:c, :float)
  end
end
