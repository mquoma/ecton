defmodule EctoNoDbWeb.PageController do
  use EctoNoDbWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
