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

    live "/beige/split_screen", Biege.SplitScreen

    live "/gold/full_screen", Gold.FullScreen
    live "/gold/split_screen", Gold.SplitScreen
    live "/beige_premium/full_screen", BeigePremium.FullScreen
    live "/beige_premium/split_screen", BeigePremium.SplitScreen
    live "/orange/full_screen", Orange.FullScreen
    live "/orange/split_screen", Orange.SplitScreen
    live "/maroon/full_screen", Maroon.FullScreen
    live "/maroon/split_screen", Maroon.SplitScreen
    live "/green/full_screen", Green.FullScreen
    live "/green/split_screen", Green.SplitScreen
    live "/blue/full_screen", Blue.FullScreen
    live "/blue/split_screen", Blue.SplitScreen
    live "/gray_premium/full_screen", GrayPremium.FullScreen
    live "/gray_premium/split_screen", GrayPremium.SplitScreen
    live "/greenish/full_screen", Greenish.FullScreen
    live "/greenish/split_screen", Greenish.SplitScreen
    live "/dark_blue_premium/full_screen", DarkBluePremium.FullScreen
    live "/dark_blue_premium/split_screen", DarkBluePremium.SplitScreen
    live "/dark_gray_premium/full_screen", DarkGrayPremium.FullScreen
    live "/dark_gray_premium/split_screen", DarkGrayPremium.SplitScreen
    live "/beige_2023_premium/full_screen", Beige2023Premium.FullScreen
    live "/beige_2023_premium/split_screen", Beige2023Premium.SplitScreen

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
