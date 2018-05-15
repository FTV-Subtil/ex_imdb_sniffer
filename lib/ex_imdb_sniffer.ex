defmodule ExIMDbSniffer do
  @moduledoc """
  Utilitiy module from retrieving structured info from IMDb
  """

  @doc """
  Get people info from IMDb ID
  """
  def people(id) do
    ExIMDbSniffer.Client.get("name/" <> id <> "/")
    |> ExIMDbSniffer.People.get_from_response()
  end
end
