defmodule ExIMDbSniffer.Client do
  use HTTPotion.Base

  @moduledoc """
  HTTP Client handler module.
  """

  @endpoint "https://www.imdb.com/"

  def process_url(url, options) do
    (@endpoint <> url)
    |> prepend_protocol
    |> append_query_string(options)
  end

  defp prepend_protocol(url) do
    if url =~ ~r/\Ahttps?:\/\// do
      url
    else
      "http://" <> url
    end
  end

  defp append_query_string(url, options) do
    if options[:query] do
      url <> "?#{URI.encode_query(options[:query])}"
    else
      url
    end
  end

  def process_request_headers(headers) do
    Keyword.put(headers, :Accept, "application/json")
  end

end
