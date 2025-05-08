defmodule AlmosquePortalV2Web.Router do
  use AlmosquePortalV2Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {AlmosquePortalV2Web.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AlmosquePortalV2Web do
    pipe_through :browser

    get "/", PageController, :home
   
    live "/beige/full_screen", Beige.FullScreen
    live "/beige/split_screen", Beige.SplitScreen
  live "/iqama/full_screen", Iqama.FullScreen
  live "/iqama/split_screen", Iqama.SplitScreen 
    live "/Customcolour/full_screen", Customcolour.FullScreen
    live "/Customcolour/split_screen", Customcolour.FullScreen
     live "/purple/full_screen", Purple.FullScreen
    live "/purple/split_screen", Purple.SplitScreen   
    live "/white/full_screen", White.FullScreen
    live "/white/split_screen", White.SplitScreen
     live "/simple/full_screen", Simple.FullScreen
      live "/simple/split_screen", Simple.SplitScreen
       live "/turquoise/full_screen", Turquoise.FullScreen
      live "/turquoise/split_screen", Turquoise.SplitScreen
  end

  # Other scopes may use custom stacks.
  # scope "/api", AlmosquePortalV2Web do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:almosque_portal_v2, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: AlmosquePortalV2Web.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
