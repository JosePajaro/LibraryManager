defmodule User do
  @type t :: %User{cc: non_neg_integer(), name: String.t(), books: [non_neg_integer()]}
  defstruct cc: 0, name: "", books: []

  def add_user(users, cc, name)do
    users = [%User{cc: cc, name: name, books: []}|users]
    IO.inspect("User #{Enum.at(users, 0).cc} create")
    :ok
  end

  def list_users(users) do
    if length(users) > 0 do
      Enum.filter(users, fn x-> IO.inspect(x) end)
    else
      IO.puts("the list users is empty")
    end
  end

end
