defmodule CallMeWeb.Router do
  use CallMeWeb.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CallMeWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", CallMeWeb, as: :api do
    pipe_through :api

    scope "/v1", V1, as: :v1 do
      resources "/event", EventController, except: [:new, :edit]
    end
  end
end
