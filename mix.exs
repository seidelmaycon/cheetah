defmodule Cheetah.MixProject do
  use Mix.Project

  def project do
    [
      app: :cheetah,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :tentacat]
    ]
  end

  defp deps do
    [
      {:tentacat, "~> 1.0.0"}
    ]
  end
end
