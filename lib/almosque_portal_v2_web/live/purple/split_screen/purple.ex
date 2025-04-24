defmodule AlmosquePortalV2Web.Purple.SplitScreen do
  use AlmosquePortalV2Web, :live_view

  @prayer_times [
    %{
      namaz_name: "FAJA",
      start_time: "03:00 am",
      iqama_time: "03:00 pm"
    },
    %{
      namaz_name: "ZUHAR",
      start_time: "03:00 am",
      iqama_time: "03:00 pm"
    },
    %{
      namaz_name: "ASR",
      start_time: "03:00 am",
      iqama_time: "03:00 pm"
    },
    %{
      namaz_name: "MAGHRIB",
      start_time: "03:00 am",
      iqama_time: "03:00 pm"
    },
    %{
      namaz_name: "ISHA",
      start_time: "03:00 am",
      iqama_time: "03:00 pm"
    },

  ]
  @jummah_prayer_times [
    %{
      namaz_name: "JUM'AH",
      start_time: "03:00 am",
      iqama_time: "03:00 pm"
    }
  ]
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:prayer_times, @prayer_times)
     |> assign(:active_prayer_time, Enum.at(@prayer_times, 2))
     |> assign(:jummah_prayer_times, @jummah_prayer_times)
     |> assign(:active_ads, "/images/10560.jpg")}
  end

  def time_part(time_string) do
    String.slice(time_string, 0, 5)
  end

  def am_pm_part(time_string) do
    String.slice(time_string, 6, 2)
  end
end
