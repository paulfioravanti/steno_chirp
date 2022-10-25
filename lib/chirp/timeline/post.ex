defmodule Chirp.Timeline.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :likes_count, :integer, default: 0
    field :reposts_count, :integer, default: 0
    field :username, :string, default: "chris_mccord"

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:body])
    |> validate_required([:body])
    |> validate_length(:body, min: 10, max: 250)
  end
end
