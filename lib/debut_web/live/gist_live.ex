defmodule DebutWeb.GistLive do
  use DebutWeb, :live_view
  alias Debut.Gists
  alias Debut.Gists.Gist
  import Phoenix.HTML
  import Phoenix.HTML.Form

  # def mount(%{"id" => id}, _session, socket) do
  #   gist = Gists.get_gist!(id)
  #   {:ok, assign(socket, gist: gist )}
  # end
  def mount(_params, _session, socket) do
    socket = assign(socket, form: to_form(Gists.change_gist(%Gist{})))
    {:ok, socket}
  end

end
