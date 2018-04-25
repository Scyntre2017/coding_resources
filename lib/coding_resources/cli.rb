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

  def selection
    puts "Please type the number of the book for more information or type next for the next 25 books."
    input = gets.strip
    if input.to_i > 0
      details(input.to_i - 1)
    elsif input.downcase == "next"
      next_page
    elsif input.downcase == "menu"
      menu
    elsif input.downcase == "exit"
      exit
    else
      puts "That was an invalid entry."
      selection
    end
  end

  def list
    puts CodingResources::Books.list
    # lists books in groups of 25 books each by grabbing data from the book_list class
    # type 'next' to get to the next group
    selection
    input = gets.strip.to_i
    details(input.to_i - 1)
  end

  def search(name)
    # searches for books from the book_list class
  end

  def details(number)
    puts "book details #{number}"
    puts "Please type 'back' or 'list' to go back to the list; type 'menu' to go back to the main menu; or type 'exit' to exit."
    input = gets.strip.downcase
    if input == "back" || input == "list"
      list
    elsif input == "menu"
      menu
    elsif input == "exit"
      exit
    end
  end

end
