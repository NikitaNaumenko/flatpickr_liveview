defmodule FlatpickrPhxLiveview.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {
    Flop.Schema,
    filterable: [
      :inserted_at_date
    ],
    sortable: [],
    adapter_opts: [
      custom_fields: [
        inserted_at_date: [
          filter: {FlatpickrPhxLiveview.DateRangeFilter, :date_filter, [source: :inserted_at]},
          ecto_type: :string,
          operators: [:in]
        ]
      ]
    ]
  }

  @timestamps_opts [type: :utc_datetime_usec]

  schema "users" do
    field :username, :string

    timestamps(type: :utc_datetime_usec)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [])
    |> validate_required([])
  end
end
