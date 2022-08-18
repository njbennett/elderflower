defmodule QueueTest do
  use ExUnit.Case, async: true
  doctest Elderflower.Queue

  describe "start_link/1" do
    test "creates a Queue" do
      assert Elderflower.Queue.start_link([])
    end
  end

  describe "pop/0" do
    test "gets a message from the queue" do
      message = "bees are good"
      Elderflower.Queue.start_link([message])
      assert message == Elderflower.Queue.pop()
    end

    test "gets the first message when there are multiple messages" do
      message1 = "dogs are weird"
      message2 = "bees are good"
      Elderflower.Queue.start_link([message1, message2])
      assert message1 == Elderflower.Queue.pop()
    end

    test "removes messages as it returns them" do
      message1 = "dogs are weird"
      message2 = "bees are good"
      Elderflower.Queue.start_link([message1, message2])
      Elderflower.Queue.pop()
      assert message2 == Elderflower.Queue.pop()
    end
  end

  describe "push/0" do
    test "puts a message into the queue" do
      message = "bees are good"
      Elderflower.Queue.start_link([])
      Elderflower.Queue.push(message)
      assert message == Elderflower.Queue.pop()
    end
  end

  describe "message?/0" do
    test "returns false when there are no messages" do
      Elderflower.Queue.start_link([])

      refute Elderflower.Queue.message?
    end

    test "returns true when there are no messages" do
      message = "bees are good"
      Elderflower.Queue.start_link([message])

      assert Elderflower.Queue.message?
    end
  end
end
