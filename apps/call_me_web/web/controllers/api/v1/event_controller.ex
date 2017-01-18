defmodule CallMeWeb.Api.V1.EventController do
  use CallMeWeb.Web, :controller

  alias CallMeWeb.Event

  def create(conn, %{"event" => event_params}) do
    conn
    # |> put_status(:created)
    # |> render("show.json", event: event_params)
  end
end
