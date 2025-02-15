defmodule DebutWeb.GistLive do
  use DebutWeb, :live_view
  alias Debut.Gists

  def mount(%{"id" => id}, _session, socket) do
    gist = Gists.get_gist!(id)
    {:ok, assign(socket, gist: gist)}
  end
end
