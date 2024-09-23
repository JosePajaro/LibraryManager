# LibraryManager

**Descripción: Esta aplicación de basa en la gestión de una biblioteca que permite añadir usuarios y lisbros y gestionar prestamos, devolucion y conover el estado de un libro**

## Compilation
**Requrimientos:**
1. Tener instalado Erlang y Elixir
**Para empezar:**
1. Clona el repositorio y ve a la carpeta librari_manager
2. Ejecuta el siguiente comando: [ iex.bat -S mix ] para compilar la aplicación y lanzarla en la maquina de Erlang
3. Creas 2 listas vacias para pasarlas como parametro
```elixir
  users = []
  books = []
```
4. Llama a library manager y pasa como parametro las 2 listas creadas en su funcion run:
```elixir
  LibraryManager.run(users,books)
```

## Como funciona
**La aplicación cuenta con 3 módulos: User|Book|LibraryManager con 9 funciones incluida run() desde las que se ejecuta la logica, las funciones son:**
1. ***add_user/3*** Esta función recibe 3 parametros, una lista de usuarios, la cc y el user name de nuevo usuario y retorna la lista con el asuario ingresado, en caso de que no exista, si existe, devuelve un mensaje informandolo 
2. ***list_usrer/1*** Esta función recibe 1 parametro, una lista de usuarios y filtra la lista uno por uno, si la lista esta vacía lo informa
3. ***add_book/5***Esta función recibe 3 parametros, una lista de libros, el ISBM como identificador unico del libro, el nombre y el autor del libro y la cantidad disponible y retorna la lista con el libro ingresado, en caso de que no exista, si existe, devuelve un mensaje informandolo
4. ***list_books/1*** Esta función recibe 1 parametro, una lista de libros y filtra la lista uno por uno, si la lista esta vacía lo informa
5. ***stock_book/2*** Esta función recibe 2 parametros, una lista de libros y un ISBM para la busqueda de ese libro y muestra la cantidad disponible en el momento, si la lista está vacío o el libro no existe lo informa con un mensaje
6. ***lend_book/4*** Esta funcion recibe 4 parametros, las 2 listas de usuarios y libros y tanto la identificación del usuario, como la del libro para anexar el ISBM del libro a una lista de libros que tiene el usuario para validar los libros prestados, y retorna una tupla con las 2 listas 
7. ***return_book/4*** Esta funcion recibe 4 parametros, las 2 listas, la de usuarios y libros y tanto la identificación del usuario, como la del libro para quitar el ISBM del libro prestado al usuario y suma uno al stock del libro, y retorna una tupla con las 2 listas
8. ***borrowed_book/3*** Esta funcion recibe 3 parametros, las 2 listas y la identificación del usuario al que se le desea consultar los libros que tiene prestados en el momentos, valida en la lista de libros que tiene el usuario y filtra en los libros los nombres de los libros que coninciden con el ISBM
9. ***run/2*** Esta función recibe 2 parámetros, una lista de usuarios y una de libros que funcionan como almacen de los precesos de llenado y listados tanto de usuarios como de libros
