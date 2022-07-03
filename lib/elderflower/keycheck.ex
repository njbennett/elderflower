defmodule Elderflower.KeyCheck do

  def check(key) do
    datetime = DateTime.now!("Etc/UTC")
    String.match?(key, ~r/ed#{datetime.year}$/)
  end
end
