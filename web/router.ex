defmodule BlockApi.Router do
  use BlockApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BlockApi do
    pipe_through :api

    resources "/last_blocks", BlockController, only: [:show]
    resources "/add_data", BlockController, only: [:create]
  end
end
