defmodule KeyCheckTest do
  use ExUnit.Case, async: true
  doctest Elderflower.KeyCheck

  test "it accepts well-formed keys" do
    assert Elderflower.KeyCheck.check("c761fd8e4abc6ee4ca6d0883a95b7f0c88d33835a085b382dfbfb435283e0623")
  end

  test "it rejects keys that don't match /ed[0-9]{4}$/" do
    refute Elderflower.KeyCheck.check("1c6ffef2825b294274478bad8c80a7a610d38245a9fded18cd004c4a67000000")
  end

  test "it rejects keys that don't end in the current year" do
    datetime = DateTime.now!("Etc/UTC") |> DateTime.add(31536000, :second)
    year = datetime.year
    refute Elderflower.KeyCheck.check("1c6ffef2825b294274478bad8c80a7a610d38245a9fded18cd004c4a67ed#{year}")
  end
end
