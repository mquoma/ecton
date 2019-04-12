defmodule EctoNoDbWeb.SearchView do
  use EctoNoDbWeb, :view

  def render("error.json", errors) do
    errors
  end
end
