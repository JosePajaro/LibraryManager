defmodule Book do
  @type t :: %Book{isbm: non_neg_integer(), title: String.t(), author: String.t(), stock: non_neg_integer()}
  defstruct isbm: 0, title: "", author: "", stock: 0

  def add_book(books, isbm, title, author, stock) do
    books = [%Book{isbm: isbm, title: title, author: author, stock: stock}|books]
    IO.puts("The book '#{Enum.at(books,0).title}' was added successfully!! ")
    :ok
  end

  def list_books(books) do
    if length(books) > 0 do
      Enum.filter(books, fn x-> IO.inspect(x) end)
    else
       IO.puts("the list books is empty")
    end
  end

  @doc """
  Esta función puede simplemente devolver :ok y un mensaje que contenga el stock del libro pero de deolvió el valor
  """
  def stock_book(books, isbm) do
    if length(books) > 0 do
      book = Enum.find(books, &(&1.isbm == isbm))
      if book != nil do
        IO.puts("The stock of the book '#{book.title}' is: #{book.stock}")
        #:ok
        book.stock
      else
        IO.puts("The book #{book.isbm} not exists!!")
      end
    else
      IO.puts("the list books is empty")
    end
  end
end
