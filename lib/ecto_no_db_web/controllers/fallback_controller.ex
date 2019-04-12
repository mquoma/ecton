defmodule EctoNoDbWeb.FallbackController do
  use EctoNoDbWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{errors: errors} = changeset}) do
    errors = Ecto.Changeset.traverse_errors(changeset, fn {e, _} -> e end)

    conn
    |> put_status(:unprocessable_entity)
    |> IO.inspect(label: "CAAAAAAAAAA")
    |> render(EctoNoDbWeb.ErrorView, errors: errors)
  end

  def call(conn, error) do
    IO.inspect(error)

    conn
    |> put_status(:internal_server_error)
    |> render(EctoNoDbWeb.ErrorView, :"500")
  end
end
