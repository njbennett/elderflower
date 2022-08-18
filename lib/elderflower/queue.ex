defmodule Elderflower.Queue do
  use Agent

  def start_link(queue) do
    Agent.start_link(fn -> queue end, name: __MODULE__)
  end

  def pop() do
    queue = Agent.get(__MODULE__, &(&1))
    if queue != [] do
      head = hd(queue)
      Agent.update(__MODULE__, &( List.delete_at(&1, 0)))
      head
    end
  end

  def push(item) do
    Agent.update(__MODULE__, &( [ item | &1 ]))
  end

  def message?() do
    Agent.get(__MODULE__, & &1) != []
  end
end
