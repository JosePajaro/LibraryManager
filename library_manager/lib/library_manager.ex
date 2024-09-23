defmodule LibraryManager do
  import User
  import Book

  def lend_book(users, books, cc, isbm) do
    if Enum.find(books, &(&1.isbm == isbm)) && Enum.find(users, &(&1.cc == cc))do
      user = Enum.find(users, &(&1.cc == cc))
      users = List.delete(users, user)
      book = Enum.find(books, &(&1.isbm == isbm))
      books = List.delete(books, book)
      new_stock = book.stock - 1
      if new_stock < 0 do
        IO.puts("Don't have stock")
        :false
      else
        {
          [Map.put(user, :books, [book.isbm|user.books])|users],
          [Map.put(book, :stock, new_stock)|books]
        }
        #:ok
      end
    else
      IO.puts("The user or the book does not exist, check the datebase!")
      :fase
    end
  end

  def return_book(users, books, cc, isbm) do
    if Enum.find(books, &(&1.isbm == isbm)) && Enum.find(users, &(&1.cc == cc))do
      user = Enum.find(users, &(&1.cc == cc))
      users = List.delete(users, user)
      book = Enum.find(books, &(&1.isbm == isbm))
      books = List.delete(books, book)
      IO.puts("The #{book.name} book has been successfully lent!")
      {
        [Map.put(user, :books, List.delete(user.books, isbm))|users],
        [Map.put(book, :stock, book.stock+1)|books]
      }
      #:ok
    else
      IO.puts("The user or the book does not exist, check the datebase!")
      :fase
    end
  end

  def borrowed_books(users, books, cc) do
    if Enum.find(users, &(&1.cc == cc)) do
      user = Enum.find(users, &(&1.cc == cc))
      IO.puts "The user hasthe following books"
      Enum.each(user.books, (fn x ->
        book = Enum.find(books, &(&1.isbm == x))
        IO.puts(": #{book.title}")end)
      )
      :ok
    else
      IO.puts("The user or the book does not exist, check the datebase!")
      :false
    end
  end

  def run(users,books)do
    IO.puts("------------------------------------------\nWelcome to the Library Manager!\n1. Add a user\n2. Add a book\n3. List users\n4. List books\n5. View stock a book\n6. Lead book\n7. Return book\n8. Borrowed book\n0. Exit\n------------------------------------------")
    {n,_} = IO.gets("Insert the options: ")
    |>Integer.parse()
    case n do
      1 ->
        {cc,_} = Integer.parse(IO.gets("Insert your identification: "))
        name = IO.gets("Insert the user name: ")
        users = add_user(users, cc, name)
        run(users,books)
      2->
        {isbm,_} = Integer.parse(IO.gets("Insert the ISBM that book(Only numbers): "))
        name = IO.gets("Insert the book name: ")
        author = IO.gets("Insert the author name: ")
        {stock,_} = Integer.parse(IO.gets("Insert the book stock: "))
        books = add_book(books, isbm, name, author, stock)
        run(users,books)
      3->
        list_users(users)
        run(users,books)
      4->
        list_books(books)
        run(users,books)
      5->
        {isbm,_} = Integer.parse(IO.gets("Insert the ISBM that book(Only numbers): "))
        stock_book(books, isbm)
        run(users,books)
      6 ->
        {cc,_} = Integer.parse(IO.gets("Insert your identification: "))
        {isbm,_} = Integer.parse(IO.gets("Insert the ISBM that book(Only numbers): "))
        {users,books} = lend_book(users, books, cc, isbm)
        run(users,books)
      7 ->
        {cc,_} = Integer.parse(IO.gets("Insert your identification: "))
        {isbm,_} = Integer.parse(IO.gets("Insert the ISBM that book(Only numbers): "))
        {users,books} = return_book(users, books, cc, isbm)
        run(users,books)
      8 ->
        {cc,_} = Integer.parse(IO.gets("Insert your identification: "))
        borrowed_books(users, books, cc)
        run(users,books)
      0 ->
        IO.puts("Thank you for using the Library Manager!\nBye...")
        :ok
      _ ->
        IO.puts("Invalid option!")
        run(users,books)
    end
  end
end
