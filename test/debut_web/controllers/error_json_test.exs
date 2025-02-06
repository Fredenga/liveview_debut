defmodule DebutWeb.ErrorJSONTest do
  use DebutWeb.ConnCase, async: true

  test "renders 404" do
    assert DebutWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert DebutWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
