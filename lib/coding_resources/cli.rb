class CodingResources::CLI

  def run
    menu
  end

  def menu
    CodingResources::Books.create_all_books
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

  def list
    n = 0
    while n >= 0 && n <= CodingResources::Books.length

      CodingResources::Books.list[n]
      puts "Please type the number of the book for more information or type 'next' for the next 15 books."
      #or type 'search' to search for a book.
      input = gets.strip
      if input.to_i > 0
        details(input.to_i - 1)
      elsif input.downcase == "next"
        n += 1
      elsif input.downcase == "back"
        n -= 1
      elsif input.downcase == "search"
        puts "Please enter the name of the book you are searching for."
        i = gets.strip.downcase
        search(i)
        list(0)
      elsif input.downcase == "exit"
        exit
      else
        puts "That was an invalid entry."
      end

    end
  end

  #def search(name)
  #  CodingResources::Books.search(name)
  #  list
  #end

  def details(number)
    book = CodingResources::Books.cycle_pages[number]
    book.details
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
