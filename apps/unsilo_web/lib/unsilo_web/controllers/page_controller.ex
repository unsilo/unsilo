defmodule UnsiloWeb.PageController do
  use UnsiloWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", volumes: File.ls!("/root/"), mnts: File.ls!("/root/unsilo/"))
  end
end
