defmodule ElderflowerWeb.BoardController do
  use ElderflowerWeb, :controller

  def show(conn, _params) do
    text(conn, "")
  end

  def update(conn, _params) do
    send_resp(conn, 401, "")
  end
end
