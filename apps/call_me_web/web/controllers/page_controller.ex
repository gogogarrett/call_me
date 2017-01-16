defmodule CallMeWeb.PageController do
  use CallMeWeb.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
