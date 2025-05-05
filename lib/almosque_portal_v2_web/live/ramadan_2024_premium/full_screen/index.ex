defmodule AlmosquePortalV2Web.Ramadan2024Premium.FullScreen do
  use AlmosquePortalV2Web, :live_view

  @prayer_times [
    %{
      namaz_name: "FAJA",
      start_time: "04:30 am",
      iqama_time: "05:00 am"
    },
    %{
      namaz_name: "ZUHAR",
      start_time: "12:15 pm",
      iqama_time: "01:00 pm"
    },
    %{
      namaz_name: "ASR",
      start_time: "03:45 pm",
      iqama_time: "04:30 pm"
    },
    %{
      namaz_name: "MAGHRIB",
      start_time: "06:20 pm",
      iqama_time: "06:30 pm"
    },
    %{
      namaz_name: "ISHA",
      start_time: "07:45 pm",
      iqama_time: "08:15 pm"
    },
    %{
      namaz_name: "JUM'AH",
      start_time: "12:30 pm",
      iqama_time: "01:15 pm"
    }
  ]
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:prayer_times, @prayer_times)
     |> assign(:active_prayer_time, Enum.at(@prayer_times, 2))}
  end


  def time_part(time_string) do
    String.slice(time_string, 0, 5)
  end

  def am_pm_part(time_string) do
    String.slice(time_string, 6, 2)
  end
end
