defmodule DebutWeb.CreateGistLive do

  # ... your LiveView code ...
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

  def handle_event("create", %{"gist" => params}, socket) do
    case Gists.create_gist(socket.assigns.current_user, params) do
      {:ok, _gist} ->
        socket = push_event(socket, "clear-textareas", %{})
        # reset our form with empty Gist struct
        changeset = Gists.change_gist(%Gist{})
        socket = assign(socket, :form, to_form(changeset))

        {:noreply, push_navigate(socket, to: "/gist?#{[id: params.id]}")}

      {:error, %Ecto.Changeset{} = changeset} ->
        # show errors but keep form intact
        {:noreply, assign(socket, :form, to_form(changeset))}

    end

  end
  def handle_event("validate", %{"gist" => params}, socket) do
    changeset = %Gist{}
                |> Gists.change_gist(params)
                |> Map.put(:action, :validate)
    {:noreply, assign(socket, :form, to_form(changeset))}
  end

end
