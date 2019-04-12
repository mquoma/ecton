defmodule EctoNoDbWeb.EventSearchView do
  use EctoNoDbWeb, :view

  def render("index.json", %{results: results}) do
    %{data: render_many(results, EctoNoDbWeb.EventSearchView, "result.json")}
    results
  end

  def render("result.json", result) do
    result
  end
end
