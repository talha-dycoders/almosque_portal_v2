defmodule AlmosquePortalV2Web.Customcolour.FullScreen do
  use AlmosquePortalV2Web, :live_view

  @prayer_times [
    %{
      namaz_name: "FAJA",
      start_time: "05:27AM",
      iqama_time: "05:00AM"
    },
    %{
      namaz_name: "ZUHAR",
      start_time: "11:43AM",
      iqama_time: "01:30PM"
    },
    %{
      namaz_name: "ASR",
      start_time: "2:38 PM",
      iqama_time: "04:00PM"
    },
    %{
      namaz_name: "MAGHRIB",
      start_time: "4:22 PM",
      iqama_time: "4:27 PM"
    },
    %{
      namaz_name: "ISHA",
      start_time: "5:43 PM",
      iqama_time: "9:05 PM"
    },
  ]
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:prayer_times, @prayer_times)
     |> assign(:active_prayer_time, Enum.at(@prayer_times, 3))}
  end


  def time_part(time_string) do
    String.slice(time_string, 0, 5)
  end

  def am_pm_part(time_string) do
    String.slice(time_string, 6, 2)
  end
end
