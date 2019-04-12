defmodule EctoNoDbWeb.EventSearchController do
  use EctoNoDbWeb, :controller

  action_fallback(EctoNoDbWeb.FallbackController)

  def index(conn, _params) do
    render(conn, "index.json", %{})
  end

  @query_types %{name: :string, city: :string, start: :date, end: :date}
  def search(conn, query_params) do
    with {:ok, query} <- cast_params(query_params, @query_types),
         {:ok, results} <- get_results(query) do
      render(conn, "index.json", results: results)
    end
    |> case do
      {:error, error} ->
        render(conn, "index.json", results: [error])
    end
  end

  defp cast_params(query_params, types) do
    keys = Map.keys(types)

    {%{}, types}
    |> Ecto.Changeset.cast(query_params, keys)
    |> Ecto.Changeset.validate_required([:name])
    |> Ecto.Changeset.apply_action(:update)
  end

  defp get_results(results) do
    # just return a list of pretend results for now
    {:ok, [results, results]}
  end
end
