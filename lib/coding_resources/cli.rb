class CodingResources::CLI

@@page = 0

  def run
    puts "Welcome to Coding Resources"
    puts "Retrieving books..."
    CodingResources::Books.create_all_books
    menu
  end

  def menu
    puts "Please select an option"
    puts "1. List all books."
    puts "2. Search for a book."
    puts "3. Exit."
    puts ""
    input = gets.strip.to_i
    if input > 0
      case input
      when 1
        CodingResources::Books.create_pages("all_books")
        list
      when 2
        search
      when 3
        puts "Have a nice day!"
        exit
      end
    else
      puts "That was an invalid selection."
      menu
    end
  end

  def list
    if CodingResources::Books.pages.length > 0
      while @@page >= 0 && @@page <= CodingResources::Books.pages.length
        CodingResources::Books.list(@@page)

        puts ""

        puts "Please select an option:"
        puts "1. Get more details on a book."
        puts "2. Go to the next page of 15 books."
        puts "3. Go back one page."
        puts "4. Go to a specific page."
        puts "5. Search for a book."
        puts "6. Go back to the main menu"
        puts "7. Exit"
        puts ""

        input = gets.strip.to_i

        case input
        when 1
          details
          break
        when 2
          @@page += 1
        when 3
          @@page -= 1 unless @@page == 0
        when 4
          puts "Please enter 1-#{CodingResources::Books.pages.length} to go to that specific page."
          i = gets.strip.to_i
          @@page = i - 1
        when 5
          search
          break
        when 6
          menu
          break
        when 7
          exit
        when input > 6 || input < 1
          puts "That was an invalid entry."
        end
      end
    else
      puts ""
      puts "No results found."
      puts "Going back to the main menu"
      puts ""
      menu
    end
  end

  def search
    puts "Please enter the name or part of the name of the book you are searching for."
    input = gets.strip.downcase
    CodingResources::Books.search(input)
    CodingResources::Books.create_pages("search")
    @@page = 0
    list
  end

  def details
    puts "Please type the number of the book you would like more information on."

    puts ""
    input = gets.strip.to_i
    puts ""

    book = CodingResources::Books.pages[@@page][input - 1]
    book.details

    i = 0
    while i < 1 || i > 3
      puts ""
      puts "Please select an option:"
      puts "1. Go back to the list of books."
      puts "2. Search for a new book."
      puts "3. Exit"
      puts ""
      i = gets.strip.to_i
      if i > 0
        case i
        when 1
          list
        when 2
          search
        when 3
          puts "Have a nice day!"
          exit
        end
      else
        puts "That was an invalid selection."
      end
    end
  end

end
