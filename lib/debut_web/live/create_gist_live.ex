defmodule DebutWeb.CreateGistLive do
  use DebutWeb, :live_view
  alias Debut.{Gists, Gists.Gist}
  # call_back_fn -> mount, render, handle

  def mount(_params, _session, socket) do
    socket = assign(
      socket,
      form: to_form(Gists.change_gist(%Gist{}))
    )
    {:ok, socket}
  end


end
