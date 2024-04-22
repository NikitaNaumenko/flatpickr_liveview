# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FlatpickrPhxLiveview.Repo.insert!(%FlatpickrPhxLiveview.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
users =
  Enum.map(1..25, fn idx ->
    time = DateTime.utc_now() |> DateTime.add(-idx, :day)
    %{username: "username-#{idx}", inserted_at: time, updated_at: time}
  end)

FlatpickrPhxLiveview.Repo.insert_all(FlatpickrPhxLiveview.Users.User, users)

users =
  Enum.map(1..25, fn idx ->
    time = DateTime.utc_now() |> DateTime.add(-idx, :day)

    %{
      username: "username-1-#{idx}",
      inserted_at: time,
      updated_at: time
    }
  end)

FlatpickrPhxLiveview.Repo.insert_all(FlatpickrPhxLiveview.Users.User, users)

users =
  Enum.map(1..25, fn idx ->
    time = DateTime.utc_now() |> DateTime.add(-idx, :day)

    %{
      username: "username-2-#{idx}",
      inserted_at: time,
      updated_at: time
    }
  end)

FlatpickrPhxLiveview.Repo.insert_all(FlatpickrPhxLiveview.Users.User, users)

users =
  Enum.map(1..25, fn idx ->
    time = DateTime.utc_now() |> DateTime.add(-idx, :day)

    %{
      username: "username-3-#{idx}",
      inserted_at: time,
      updated_at: time
    }
  end)

FlatpickrPhxLiveview.Repo.insert_all(FlatpickrPhxLiveview.Users.User, users)
