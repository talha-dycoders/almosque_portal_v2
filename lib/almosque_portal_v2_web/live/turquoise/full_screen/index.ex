
defmodule AlmosquePortalV2Web.Turquoise.FullScreen do
  use AlmosquePortalV2Web, :live_view

  @prayer_times [
    %{
      namaz_name: "FAJR",
      start_time: "5:27 AM",
      iqama_time: "6:15 AM"
    },
    %{
      namaz_name: "DHUHR",
      start_time: "12:17 PM",
      iqama_time: "1:15 PM"
    },
    %{
      namaz_name: "ASR",
      start_time: "4:14 PM",
      iqama_time: "4:00 PM"
    },
    %{
      namaz_name: "MAGHRIB",
      start_time: "6:01 PM",
      iqama_time: "6:06 PM"
    },
    %{
      namaz_name: "ISHA",
      start_time: "7:09 PM",
      iqama_time: "9:15 PM"
    }
  ]

  @entrance_times [
    %{
      label: "6:38AM",
      type: "SUNRISE"
    },
    %{
      label: "12:17PM",
      type: "JUMMAH "
    },
    %{
      label: "1:15PM",
      type: "JUMUAH 1"
    },
    %{
      label: "6:01PM",
      type: "SUNSET"
    }
  ]

  def mount(_params, _session, socket) do

    active_prayer_time = Enum.find(@prayer_times, fn p -> p.namaz_name == "ASR" end)



    next_iqama_time = "9:15AM"
    next_iqama_label = "NEXT IQAMMAH IN"
    next_iqama_countdown = %{hours: 4, minutes: 0} # 4HR 0MIN

    {:ok,
     socket
     |> assign(:prayer_times, @prayer_times)
     |> assign(:active_prayer_time, active_prayer_time)
     |> assign(:entrance_times, @entrance_times)
     |> assign(:next_iqama_time, next_iqama_time)
     |> assign(:next_iqama_label, next_iqama_label)
     |> assign(:next_iqama_countdown, next_iqama_countdown)
     |> assign(:current_time, next_iqama_time)
     |> assign(:date_string, "TUESDAY 23-23")
     |> assign(:hijri_date, "SHA'BAN 1444")
     |> assign(:arabic_right, "إِنَّ الصَّلَاةَ كَانَتْ عَلَى ")
     |> assign(:arabic_left, "الْمُؤْمِنِينَ كِتَابًا مَوْقُوتًا ")}
  end

  # Extracts the time part (e.g., "5:27") from "5:27 AM"
  def time_part(time_string) do
    String.slice(time_string, 0, 5)
  end

  # Extracts the am/pm part (e.g., "AM") from "5:27 AM"
  def am_pm_part(time_string) do
    String.slice(time_string, 5..-1) |> String.trim()
  end

  # Returns the countdown string, e.g., "4HR 0MIN"
  def countdown_string(%{hours: h, minutes: m}) do
    "#{h}HR #{m}MIN"
  end

  # Returns just the numeric part for big font
  def countdown_numeric(%{hours: h, minutes: m}) do
    "#{h}:#{String.pad_leading("#{m}", 2, "0")}"
  end
end
