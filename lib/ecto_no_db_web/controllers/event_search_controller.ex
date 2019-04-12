defmodule EctoNoDbWeb.EventSearchController do
  use EctoNoDbWeb, :controller

  action_fallback(EctoNoDbWeb.FallbackController)

  @query_types %{name: :string, city: :string, start: :date, end: :date}
  def index(conn, query_params) do
    with {:ok, query} <- cast_params(query_params, @query_types),
         {:ok, results} <- get_results(query) do
      render(conn, EctoNoDbWeb.SearchView, results)
    end
  end

  defp cast_params(query_params, types) do
    keys = Map.keys(types)

    {%{}, types}
    |> Ecto.Changeset.cast(query_params, keys)
    |> Ecto.Changeset.apply_action(:update)
  end

  defp get_results(_) do
    {:ok, "results"}
  end
end
