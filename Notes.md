The CLI
1. Running the CLI should create a call to the Book class to create all books with name, desc_url, and short_desc.
2. CLI should be able to call the Book class to cycle through all books, 25 books at a time.
3. CLI should be able to create a search call to the Book class and return only the books that match the search.
4. CLI should be able to get details of long_desc and book_url for each book selected.

The Book class
1. The first call the Book class gets should create all books using the Scraper class.
2. The Book class should create multiple pages of books based on either all books or searched for books.
3. The Book class should pass along the desc_url in order to get additional details for each book object.
4. The Book class should be able to take letters and numbers and search for them in each book name.

The Scraper Class.
1. Should initialy create all books from a hash of each book.
2. Should be able to get details on each specific book.
