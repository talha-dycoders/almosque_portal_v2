defmodule AlmosquePortalV2Web.White1.FullScreen do
  use AlmosquePortalV2Web, :live_view

  @prayer_times [
    %{
      namaz_name: "FAJA",
      arabic_name: "الفجر",
      start_time: "04:30 am",
      iqama_time: "05:00 am",
      athan_time: "06:00 am"
    },
    %{
      namaz_name: "ZUHAR",
      arabic_name: "الظهر",
      start_time: "12:15 pm",
      iqama_time: "01:00 pm",
      athan_time: "06:00 am"
    },
    %{
      namaz_name: "ASR",
      arabic_name: "العصر",
      start_time: "03:45 pm",
      iqama_time: "04:30 pm",
      athan_time: "06:00 am"
    },
    %{
      namaz_name: "MAGHRIB",
      arabic_name: "المغرب",
      start_time: "06:20 pm",
      iqama_time: "06:30 pm",
      athan_time: "06:00 am"
    },
    %{
      namaz_name: "ISHA",
      arabic_name: "العشاء",
      start_time: "07:45 pm",
      iqama_time: "08:15 pm",
      athan_time: "06:00 am"
    },
    %{
      namaz_name: "JUM'AH",
      arabic_name: "الجمعة",
      start_time: "12:30 pm",
      iqama_time: "01:15 pm",
      athan_time: "06:00 am"
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
