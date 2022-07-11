defmodule ElderflowerWeb.BoardController do
  use ElderflowerWeb, :controller
  require Elderflower.Server

  def show(conn, _params) do
    html(conn, "some board contents")
  end

  def update(conn, _params) do
    send_resp(conn, 401, "")
  end
end
