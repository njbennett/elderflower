defmodule KeyCheckTest do
  use ExUnit.Case, async: true
  doctest Elderflower.KeyCheck

  describe "check/1" do
    test "it accepts well-formed keys" do
      assert Elderflower.KeyCheck.check(
               "c761fd8e4abc6ee4ca6d0883a95b7f0c88d33835a085b382dfbfb435283e0623"
             )
    end

    test "it rejects keys that don't match /ed[0-9]{4}$/" do
      refute Elderflower.KeyCheck.check(
               "1c6ffef2825b294274478bad8c80a7a610d38245a9fded18cd004c4a67000000"
             )
    end

    test "it rejects keys that don't end in the current year" do
      datetime = DateTime.now!("Etc/UTC") |> DateTime.add(31_536_000, :second)
      year = datetime.year

      refute Elderflower.KeyCheck.check(
               "1c6ffef2825b294274478bad8c80a7a610d38245a9fded18cd004c4a67ed#{year}"
             )
    end

    test "rejects 63 character strings" do
      refute Elderflower.KeyCheck.check(
               "761fd8e4abc6ee4ca6d0883a95b7f0c88d33835a085b382dfbfb435283e0623"
             )
    end
  end

  describe "test_check" do
    test "accepts 64 character strings that end with 'a'" do
      test_key = String.duplicate("a", 64)

      assert Elderflower.KeyCheck.test_check(test_key)
    end

    test "rejects 64 character strings that don't end with 'a'" do
      test_key = String.duplicate("b", 64)

      refute Elderflower.KeyCheck.test_check(test_key)
    end

    test "rejects 63 character strings" do
      test_key = String.duplicate("a", 63)

      refute Elderflower.KeyCheck.test_check(test_key)
    end
  end
end
