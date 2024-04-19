defmodule FlatpickrPhxLiveviewWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available.
  The "root" layout is a skeleton rendered as part of the
  application router. The "app" layout is set as the default
  layout on both `use FlatpickrPhxLiveviewWeb, :controller` and
  `use FlatpickrPhxLiveviewWeb, :live_view`.
  """
  use FlatpickrPhxLiveviewWeb, :html

  embed_templates "layouts/*"
end
