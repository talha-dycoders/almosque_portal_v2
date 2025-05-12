defmodule AlmosquePortalV2Web.Turquoise.SplitScreen do
  use AlmosquePortalV2Web, :live_view

  @prayer_times [
    %{
      namaz_name: "FAJR",
      start_time: "03:53am",
      iqama_time: "05:50am"
    },
    %{
      namaz_name: "DHUHR",
      start_time: "12:50pm",
      iqama_time: "02:00pm"
    },
    %{
      namaz_name: "ASR",
      start_time: "05:50pm",
      iqama_time: "06:50pm"
    },
    %{
      namaz_name: "MAGHRIB",
      start_time: "07:57pm",
      iqama_time: "08:02pm"
    },
    %{
      namaz_name: "ISHA",
      start_time: "09:26pm",
      iqama_time: "10:20pm"
    }
  ]

  @jummah_prayer_times [
    %{
      namaz_name: "JUMUAH",
      start_time: "01:50pm",
      iqama_time: "02:00pm"
    }
  ]

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:prayer_times, @prayer_times)
     |> assign(:active_prayer_time, Enum.at(@prayer_times, 2)) # Default to ASR
     |> assign(:jummah_prayer_times, @jummah_prayer_times)
     |> assign(:active_ads, "https://quran.com/")
     |> assign(:sunrise_time, "05:44 am")
     |> assign(:sunset_time, "07:57 pm")
     |> assign(:next_iqama_time, "03:12")}
  end

  def time_part(time_string) do
    String.slice(time_string, 0, 5)
  end

  def am_pm_part(time_string) do
    String.slice(time_string, 5, 3)
  end
end
