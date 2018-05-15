defmodule ExIMDbSniffer.People do
  @doc """
  IMDb people utility module.
  """

  @enforce_keys [:name, :birth_date]
  defstruct [
    :name,
    :birth_date,
    :birth_location,
    :picture_url
  ]

  def get_from_response(response) do
    overview =
      response.body
      |> get_overview_elem

    name = get_name(overview)

    birth_date = get_birth_date(response.body)
    birth_location = get_birth_location(response.body)

    picture_url = get_picture_url(overview)

    %ExIMDbSniffer.People{
      birth_date: birth_date,
      birth_location: birth_location,
      name: name,
      picture_url: picture_url
    }
  end

  defp get_overview_elem(body) do
    body
    |> Floki.find("#name-overview-widget")
  end

  defp get_name(overview) do
    overview
    |> Floki.find("[itemprop=name]")
    |> Floki.text()
  end

  defp get_birth_date(body) do
    body
    |> Floki.find("#name-born-info")
    |> Floki.find("[itemprop=birthDate]")
    |> Floki.attribute("datetime")
    |> List.first()
  end

  defp get_birth_location(body) do
    body
    |> Floki.find("#name-born-info>a")
    |> Floki.text()
  end

  defp get_picture_url(overview) do
    overview
    |> Floki.find("#name-poster")
    |> Floki.attribute("src")
    |> List.first()
  end
end
