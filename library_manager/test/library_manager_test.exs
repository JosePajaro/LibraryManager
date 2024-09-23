defmodule LibraryManagerTest do
  use ExUnit.Case
  doctest Book
  doctest User
  doctest LibraryManager

  test "Testing add_book/5 that module Book" do
    books = []
    assert Book.add_book(books, 1234567890, "Book Title", "Author Name", 20) == [%Book{isbm: 1234567890, title: "Book Title", author: "Author Name", stock: 20}]
  end

  test "Testing list_books/1 that module Book" do
    books = [
      %Book{isbm: 1234567890, title: "Book Title", author: "Author Name", stock: 20},
      %Book{isbm: 1234567891, title: "Book Title 1", author: "Author Name 1", stock: 21}
    ]
    assert Book.list_books(books) == [
      %Book{isbm: 1234567890, title: "Book Title", author: "Author Name", stock: 20},
      %Book{isbm: 1234567891, title: "Book Title 1", author: "Author Name 1", stock: 21}
    ]
  end

  test "Testing stock_book/2 that module Book" do
    books = [ %Book{isbm: 1234567890, title: "Book Title", author: "Author Name", stock: 20}]
    assert Book.stock_book(books, 1234567890) == 20
  end

  test "Testing add_user/2 that module User" do
    users = [%User{cc: 10028475412, name: "Jose test", books: [1, 2, 3]}]


    assert User.add_user(users, 10028475412, "Jose test") == :false
    assert User.add_user(users, 10013245327, "Jose test") == [
      %User{cc: 10013245327, name: "Jose test", books: []},
      %User{cc: 10028475412, name: "Jose test", books: [1, 2, 3]}
    ]
  end

  test "Testing list_users/1 that module User" do
    users = [
      %User{cc: 10028475412, name: "Jose test", books: [1, 2, 3]},
      %User{cc: 10019959635, name: "Margarita test", books: [4, 5, 6]}
    ]
    assert User.list_users(users) == [
      %User{cc: 10028475412, name: "Jose test", books: [1, 2, 3]},
      %User{cc: 10019959635, name: "Margarita test", books: [4, 5, 6]}
    ]
  end

  test "Testing lend_book/4 that module LibraryManager" do
    users = [%User{cc: 10028475412, name: "Jose test", books: [1, 2, 3]}]
    books = [ %Book{isbm: 1234567890, title: "Book Title", author: "Author Name", stock: 20}]
    assert LibraryManager.lend_book(users, books, 10028475412, 1234567890) == {
      [%User{cc: 10028475412, name: "Jose test", books: [1234567890, 1, 2, 3]}],
      [%Book{isbm: 1234567890, title: "Book Title", author: "Author Name", stock: 19}]
    }
  end

  test "Testing return_book/4 that module LibraryManager" do
    users = [%User{cc: 10028475412, name: "Jose test", books: [1234567890, 1, 2, 3]}]
    books = [%Book{isbm: 1234567890, title: "Book Title", author: "Author Name", stock: 19}]
    assert LibraryManager.return_book(users, books, 10028475412, 1234567890) == {
      [%User{cc: 10028475412, name: "Jose test", books: [1, 2, 3]}],
      [%Book{isbm: 1234567890, title: "Book Title", author: "Author Name", stock: 20}]
    }
    #book = Enum.find(books, &(&1.isbm == 1234567890))
    #assert book.stock == 20
  end

  test "Testing borrowed_books/3 that module LibraryManager" do
    users = [%User{cc: 10028475412, name: "Jose test", books: [1234567890, 1234567891]}]
    books = [
      %Book{isbm: 1234567890, title: "Book Title", author: "Author Name", stock: 20},
      %Book{isbm: 1234567891, title: "Book Title 1", author: "Author Name 1", stock: 20}
    ]

    assert LibraryManager.borrowed_books(users, books, 10028475412) == :ok
  end

end
