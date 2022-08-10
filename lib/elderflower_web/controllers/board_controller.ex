defmodule ElderflowerWeb.BoardController do
  use ElderflowerWeb, :controller
  alias Elderflower.Server

  def show(conn, _params) do
    if conn.request_path == "/ca93846ae61903a862d44727c16fed4b80c0522cab5e5b8b54763068b83e0623" do
      html(conn, "")
    else
      contents = Server.get_board_by_key("some key").content
      html(conn, contents)
    end
  end

  def update(conn, _params) do
    send_resp(conn, 401, "")
  end
end
