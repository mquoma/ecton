defmodule EctoNoDbWeb.FallbackController do
  use EctoNoDbWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{errors: errors}}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(EctoNoDbWeb.ErrorView)
    |> render("error.json", errors)
  end
end
