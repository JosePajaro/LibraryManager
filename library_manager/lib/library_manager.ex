defmodule LibraryManager do
  def lend_book(users, books, cc, isbm) do
    if Enum.find(books, &(&1.isbn == isbm)) && Enum.find(users, &(&1.cc == cc))do
      user = Enum.find(users, &(&1.cc == cc))
      book = Enum.find(books, &(&1.isbn == isbm))
      new_stock = book.stock - 1
      if new_stock < 0 do
        IO.puts("No hay suficiente stock")
      else
        IO.inspect(book)
        IO.inspect(user)
      end
    else
      IO.puts("El libro o el usuario no han sido creados, consulta las bases de datos")
    end

  end

  def return_book(users, books, cc, isbm) do

  end

  def borrowed_books(users, books, cc) do

  end

  def run()do
    users = []
    books = []
  end

end
