defmodule Elderflower.KeyCheck do

  def check(key) do
    String.match?(key, ~r/83e(0[1-9]|1[0-2])(\d\d)$/) && String.length(key) == 64
  end

  def test_check(key) do
    String.match?(key, ~r/a$/) && String.length(key) == 64
  end
end
