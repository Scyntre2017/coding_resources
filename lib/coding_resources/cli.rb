class CodingResources::CLI

@@page = 0

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
    while @@page >= 0 && @@page <= CodingResources::Books.pages.length
      CodingResources::Books.list(@@page)

      puts ""

      puts "Please select an option:"
      puts "1. Get more details on a book."
      puts "2. Go to the next page of 15 books."
      puts "3. Go back one page."
      puts "4. Go to a specific page."
      puts "5. Search for a book."
      puts "6. Exit"
      puts ""

      input = gets.strip.to_i

      case input
      when 1
        details
        break
      when 2
        @@page += 1
      when 3
        @@page -= 1
      when 4
        puts "Please enter 1-#{CodingResources::Books.pages.length} to go to that specific page."
        i = gets.strip.to_i
        @@page = i - 1
      when 5
        search
        break
      when 6
        exit
      when input > 6 || input < 1
        puts "That was an invalid entry."
      end

    end
  end

  #def search(name)
  #  puts "Please enter the name of the book you are searching for."
  #  input = gets.strip.downcase
  #  CodingResources::Books.search(input)
  #  @@page = 0
  #  list
  #end

  def details
    puts "Please type the number of the book you would like more information on."

    puts ""
    input = gets.strip.to_i
    puts ""

    book = CodingResources::Books.pages[@@page][input - 1]
    book.details

    puts ""
    puts "Please type 'back' or 'list' to go back to the list; type 'search' to search for a new book; or type 'exit' to exit."
    puts ""
    i = gets.strip.downcase
    if i == "back" || i == "list"
      list
    elsif input == "search"
      search
    elsif input == "exit"
      exit
    end
  end

end
