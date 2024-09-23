defmodule User do
  @type t :: %User{cc: non_neg_integer(), name: String.t(), books: [non_neg_integer()]}
  defstruct cc: 0, name: "", books: []

  def add_user(users, cc, name)do
    if Enum.find(users, &(&1.cc == cc))do
      IO.puts("User with the same cc already exists")
      :false
    else
      users = [%User{cc: cc, name: name, books: []}|users]
      IO.inspect("User #{Enum.at(users, 0).cc} create")
      users
      #:ok
    end
  end

  def list_users(users) do
    if length(users) > 0 do
      Enum.filter(users, fn x-> IO.inspect(x) end)
    else
      IO.puts("the list users is empty")
      users
    end
  end

end
