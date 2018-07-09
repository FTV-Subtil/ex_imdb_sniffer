defmodule ExIMDbSniffer.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_imdb_sniffer,
      version: "0.1.1",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "ExIMDbSniffer"
      package: package(),
      description: description(),
      source_url: "https://github.com/FTV-Subtil/ex_imdb_sniffer",
      homepage_url: "https://github.com/FTV-Subtil/ex_imdb_sniffer",
      docs: [
        main: "ExIMDbSniffer",
        extras: ["README.md"]
      ]
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

  defp description() do
    "IMDb connection to get some information about personnalities."
  end

  defp package() do
    [
      name: "ex_imdb_sniffer",
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: [
        "Marc-Antoine Arnaud",
        "Valentin Noël"
      ],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/FTV-Subtil/ex_imdb_sniffer"}
    ]
  end
end
