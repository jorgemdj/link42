defmodule Link42Web.ErrorJSONTest do
  use Link42Web.ConnCase, async: true

  test "renders 404" do
    assert Link42Web.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert Link42Web.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
