defmodule AlmosquePortalV2Web.Simple.SplitScreen do
  use AlmosquePortalV2Web, :live_view

  @prayer_times [
    %{
      namaz_name: "FAJAR",
      start_time: "3:53 am",
      iqama_time: "5:50 am"
    },
    %{
      namaz_name: "DHUHR",
      start_time: "12:50 pm",
      iqama_time: "2:00 pm"
    },
    %{
      namaz_name: "ASR",
      start_time: "5:50 pm",
      iqama_time: "6:50 pm"
    },
    %{
      namaz_name: "MAGHRIB",
      start_time: "7:57 pm",
      iqama_time: "8:02 pm"
    },
    %{
      namaz_name: "ISHA",
      start_time: "9:26 pm",
      iqama_time: "10:20 pm"
    }
  ]

  @jummah_prayer_times [
    %{
      namaz_name: "JUMUAH",
      start_time: "1:50 pm",
      iqama_time: "2:00 pm"
    }
  ]

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:prayer_times, @prayer_times)
     |> assign(:active_prayer_time, Enum.at(@prayer_times, 2)) # Default to ASR
     |> assign(:jummah_prayer_times, @jummah_prayer_times)
     |> assign(:active_ads, "https://www.quran.com/")
     |> assign(:sunrise_time, "5:44 am")
     |> assign(:sunset_time, "7:57 pm")
     |> assign(:next_iqama_time, "3:12")}
  end

  def time_part(time_string) do
    String.slice(time_string, 0, 5)
  end

  def am_pm_part(time_string) do
    String.slice(time_string, 6, 2)
  end
end
