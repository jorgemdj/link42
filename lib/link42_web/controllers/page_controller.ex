defmodule Link42Web.PageController do
  use Link42Web, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
