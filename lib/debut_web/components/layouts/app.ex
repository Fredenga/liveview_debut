defmodule DebutWeb.Layouts.App do
  alias Phoenix.LiveView.JS

  def toggle_dropdown_menu do
    JS.toggle(
      to: "#dropdown_menu"
    )
  end
end
