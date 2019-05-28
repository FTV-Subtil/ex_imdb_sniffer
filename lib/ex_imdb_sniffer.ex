defmodule ExIMDbSniffer do
  @moduledoc """
  Utilitiy module from retrieving structured info from IMDb
  """

  @doc """
  Get people info from IMDb ID
  """
  def people(id) do
    ExIMDbSniffer.Client.get("name/" <> id <> "/", [timeout: 60_000])
    |> ExIMDbSniffer.People.get_from_response()
  end
end
