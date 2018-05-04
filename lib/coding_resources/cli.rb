class CodingResources::CLI

  def run
    menu
  end

  def menu
    CodingResources::Books.all_books
    puts "Welcome to Coding Resources"
    puts "Please type 'list' for a list of all available books or type 'search' to search for a book or type 'exit' to exit."
    input = gets.strip.downcase
    if input == "list"
      list
    elsif input == "search"
      puts "Please enter the name of the book or part of the name to search for."
      i = gets.strip.downcase
      search(i)
    elsif input == "exit"
      puts "Have a nice day!"
      exit
    end
  end

  def selection
    puts "Please type the number of the book for more information, type 'next' for the next 25 books, or type 'search' to search for a book."
    input = gets.strip
    if input.to_i > 0
      details(input.to_i - 1)
    elsif input.downcase == "next"
      CodingResources::Books.next_page
      list
    elsif input.downcase == "search"
      puts "Please enter the name of the book you are searching for."
      i = gets.strip.downcase
      search(i)
    elsif input.downcase == "exit"
      exit
    else
      puts "That was an invalid entry."
      selection
    end
  end

  def list
    puts CodingResources::Books.list
    selection
  end

  def search(name)
    CodingResources::Books.search(name)
    list
  end

  def details(number)
    puts "book details #{number}"
    puts "Please type 'back' or 'list' to go back to the list; type 'search' to search for a new book; or type 'exit' to exit."
    input = gets.strip.downcase
    if input == "back" || input == "list"
      list
    elsif input == "search"
      puts "Please enter the name of the book you are searching for."
      i = gets.strip.downcase
      search(i)
    elsif input == "exit"
      exit
    end
  end

end
