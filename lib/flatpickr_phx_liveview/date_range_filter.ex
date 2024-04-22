defmodule FlatpickrPhxLiveview.DateRangeFilter do
  import Ecto.Query

  def date_filter(query, %Flop.Filter{value: value, op: _op}, opts) do
    source = Keyword.fetch!(opts, :source)
    [start, end_date] = Enum.map(value, &Date.from_iso8601!(&1))

    expr =
      dynamic(
        [r],
        fragment(
          "(?)::date BETWEEN (?)::DATE AND (?)::DATE",
          field(r, ^source),
          ^start,
          ^end_date
        )
      )

    where(query, ^expr)
  end
end
