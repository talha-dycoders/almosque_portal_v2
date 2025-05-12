defmodule AlmosquePortalV2Web.Simple.FullScreen do
  use AlmosquePortalV2Web, :live_view

  @prayer_times [
    %{
      namaz_name: "FAJAR",
      start_time: "3:53 AM",
      iqama_time: "5:50 AM"
    },
    %{
      namaz_name: "DHUHR",
      start_time: "12:50 PM",
      iqama_time: "2:00 PM"
    },
    %{
      namaz_name: "ASR",
      start_time: "5:50 PM",
      iqama_time: "6:50 PM"
    },
    %{
      namaz_name: "MAGHRIB",
      start_time: "7:57 PM",
      iqama_time: "8:02 PM"
    },
    %{
      namaz_name: "ISHA",
      start_time: "9:26 PM",
      iqama_time: "10:20 PM"
    }
  ]

  @jummah_prayer_times [
    %{
      namaz_name: "JUMUAH",
      start_time: "1:50 PM",
      iqama_time: "2:00  PM"
    }
  ]

  def mount(_params, _session, socket) do
    # The image shows ASR as the active prayer (highlighted row)
    active_prayer_time = Enum.find(@prayer_times, fn p -> p.namaz_name == "ASR" end)

    {:ok,
     socket
     |> assign(:prayer_times, @prayer_times)
     |> assign(:active_prayer_time, active_prayer_time)
     |> assign(:jummah_prayer_times, @jummah_prayer_times)
     |> assign(:active_ads, "/images/masjidal_logo.png")
     |> assign(:sunrise_time, "5:44 AM")
     |> assign(:sunset_time, "7:57 PM")
     |> assign(:next_iqama_time, "3:12 PM")
     |> assign(:current_time, "3 38 PM")
     |> assign(:date_string, "SUNDAY, MAY 5. SHA'BAN 29, 1440")}
  end

  # Extracts the time part (e.g., "3:53") from "3:53 AM"
  def time_part(time_string) do
    String.slice(time_string, 0, 5)
  end

  # Extracts the am/pm part (e.g., "AM") from "3:53 AM"
  def am_pm_part(time_string) do
    String.slice(time_string, 6, 2)
  end
end