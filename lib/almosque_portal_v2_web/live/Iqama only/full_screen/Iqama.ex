defmodule AlmosquePortalV2Web.Iqama.FullScreen do
  use AlmosquePortalV2Web, :live_view
  alias AlmosquePortalV2Web.Router.Helpers, as: Routes

 @prayer_times [
  %{name: "FAJR", start: "", iqama: "6:30AM"},          
  %{name: "DHUHR", start: "", iqama: "1:30PM"},         
  %{name: "ASR", start: "", iqama: "3:45PM"},           
  %{name: "MAGHRIB", start: "", iqama: "5:45PM"},       
  %{name: "ISHA", start: "", iqama: "5:45PM"},         
  %{name: "JUMU'AH", start: "12:30PM", iqama: "1:15PM"} 
]

  def mount(_params, _session, socket) do
  {:ok,
   socket
   |> assign(:prayer_times, @prayer_times)
   |> assign(:current_time, "8:18 AM")
   |> assign(:next_iqamah, "4hr 13min")
   |> assign(:fajr_notice, "Fajr at 6:15AM from Monday")
   |> assign(:sunrise, "5:44 AM")
   |> assign(:sunset, "4:31 PM")
   |> assign(:date_info, "Jummah Al-Awwal | Friday, Nov 15")
   |> assign(:sunrise_img, "/images/sunrise.png")
   |> assign(:sunset_img, "/images/sunset.png")}
end
end