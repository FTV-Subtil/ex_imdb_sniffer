defmodule ExIMDbSniffer.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_imdb_sniffer,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "ExIMDbSniffer"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpotion, "~> 3.1"},
      {:poison, "~> 3.1"},
      {:floki, "0.20.2"},
      {:ex_doc, "~> 0.18", only: :dev, runtime: false}
    ]
  end
end