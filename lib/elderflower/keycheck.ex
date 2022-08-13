defmodule Elderflower.KeyCheck do

  def check(key) do
    String.match?(key, ~r/83e(0[1-9]|1[0-2])(\d\d)$/)
  end
end
