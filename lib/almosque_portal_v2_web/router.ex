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

    live "/beige_simple/full_screen", BeigeSimple.FullScreen
    live "/beige_simple/split_screen", BeigeSimple.SplitScreen

    live "/customcolour/full_screen", Customcolour.FullScreen
    live "/customcolour/split_screen", Customcolour.SplitScreen

    live "/iqamah/full_screen", Iqama.FullScreen
    live "/iqamah/split_screen", Iqama.SplitScreen
    live "/purple/full_screen", Purple.FullScreen
    live "/purple/split_screen", Purple.SplitScreen

    live "/simple/split_screen", Simple.SplitScreen

    live "/white/full_screen", White.FullScreen
    live "/white/split_screen", White.SplitScreen




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
    live "/green_arabic/full_screen", GreenArabic.FullScreen
    live "/green_arabic/split_screen", GreenArabic.SplitScreen
    live "/ramadan_2024_premium/full_screen", Ramadan2024Premium.FullScreen
    live "/ramadan_2024_premium/split_screen", Ramadan2024Premium.SplitScreen

    live "/turquoise/full_screen", Turquoise.FullScreen
    live "/turquoise/split_screen", Turquoise.SplitScreen

  end

  scope "/purple", AlmosquePortalV2Web do
    pipe_through :browser
    live "/blue_theme/full_screen", Purple.BlueTheme.FullScreen
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
