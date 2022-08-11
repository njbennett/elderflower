# Elderflower

This is a Phoenix server that attempts to implement the [Spring83 spec](https://github.com/robinsloan/spring-83)

# Getting started

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

# Development

Run tests with
```
fswatch lib test | mix test --exclude bogbody --listen-on-stdin
```

The "bogbody" tag indicates tests that target Robin Sloan's example server,
and basically shouldn't be run
except to check the validity of other tests.
