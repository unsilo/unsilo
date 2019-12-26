defmodule UnsiloWeb.PageController do
  use UnsiloWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", volumes: File.ls!("/"), mnts: File.ls!("/mnt/"))
  end
end
