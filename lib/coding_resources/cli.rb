class CodingResources::CLI

  def run
    menu
  end

  def menu
    puts "Welcome to Coding Resources"
    puts "Please type 'list' for a list of books or type 'search' to search for a book or type 'exit' to exit."
    input = gets.strip.downcase
    if input == "list"
      list
    elsif input == "search"
      puts "Please enter the name of the book or part of the name to search for."
      i = gets.strip.downcase
      search(i)
    elsif input == "exit"
      puts "Have a nice day!"
    end
  end

  def list
    CodingResources::Books.all
    # lists books in groups of 25 books each by grabbing data from the book_list class
    # type 'next' to get to the next group
    puts "Please type the number of the book for more information or type next for the next 25 books."
    input = gets.strip.to_i
    details(input)
  end

  def search(name)
    # searches for books from the book_list class
  end

  def details(number)
    puts "book details #{number}"
  end

end
