defmodule ExIMDbSniffer.People do
  @doc """
  IMDb people utility module.
  """

  @enforce_keys [:name, :birth_date]
  defstruct [
    :name,
    :birth_date,
    :birth_location,
    :picture_url,
    :job_titles
  ]

  def get_from_response(response) do
    {_, _, json_ld} =
      response.body
      |> Floki.find("script")
      |> Enum.filter(fn element ->
        "application/ld+json" in Floki.attribute(element, "type")
      end)
      |> List.first()

    person = json_ld |> Jason.decode!()

    name = Map.get(person, "name")
    birth_date = Map.get(person, "birthDate")

    birth_location = get_birth_location(response.body)

    picture_url = Map.get(person, "image")
    job_title = Map.get(person, "jobTitle")

    %ExIMDbSniffer.People{
      birth_date: birth_date,
      birth_location: birth_location,
      name: name,
      picture_url: picture_url,
      job_titles: job_title
    }
  end

  defp get_birth_location(body) do
    body
    |> Floki.find("#name-born-info>a")
    |> Floki.text()
  end
end
