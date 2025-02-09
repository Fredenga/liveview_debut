defmodule DebutWeb.PageController do
  use DebutWeb, :controller

  def home(conn, _params) do
    redirect(conn, to: "/create")
  end
end
