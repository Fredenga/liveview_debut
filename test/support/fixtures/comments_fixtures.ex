defmodule Debut.CommentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Debut.Comments` context.
  """

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        markup_text: "some markup_text"
      })
      |> Debut.Comments.create_comment()

    comment
  end
end
