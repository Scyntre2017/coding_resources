class CodingResources::Books

  attr_accessor :name, :desc_url, :short_desc, :long_desc, :book_url

  @@all = []
  @@pages = []
  @@searched_books = []

  def initialize(book_hash)
    @name = book_hash.values_at(:name).join
    @desc_url = book_hash.values_at(:desc_url).join
    @short_desc = book_hash.values_at(:short_desc).join
    @@all << self unless CodingResources::Books.find_by_name(self.name)
  end

  def self.create_from_collection(book_array)
    book_array.each { |book| self.new(book)  }
  end

  def self.all
    @@all
  end

  def self.all_clear
    @@all.clear
  end

  def self.searched_books
    @@searched_books
  end

  def self.searched_books_clear
    @@searched_books.clear
  end

  def self.pages
    @@pages
  end

  def self.pages=(pages)
    @@pages = pages
  end

  def self.pages_clear
    @@pages.clear
  end

  def self.create_pages(books)
    if books == "all_books"
      self.pages_clear
      self.pages = self.all.each_slice(3).to_a
    elsif books == "search"
      self.pages_clear
      self.pages = self.searched_books.each_slice(3).to_a
    end
  end

  def self.create_all_books
    book_array = CodingResources::Scraper.scrape_all_books
    self.create_from_collection(book_array)
    self.create_pages("all_books")
  end

  def self.search(name)
    self.searched_books_clear
    self.all.each do |book|
      @@searched_books << book if book.name.downcase.split.include?(name)
    end
    self.create_pages("search")
  end

  def self.list(page)
    puts ""
    puts "Page #{page + 1}"
    puts ""
    self.pages[page].each.with_index(1) do |book, i|
      puts "#{i}. #{book.name}"
      puts "#{book.short_desc}"
    end
  end

  def self.find_by_name(name)
    self.all.detect { |i| i.name == name  }
  end

  def details
    info = CodingResources::Scraper.scrape_book_details(self.desc_url)
    self.long_desc = info.values_at(:long_desc).join
    self.book_url = info.values_at(:book_url).join
    puts "#{book.long_desc}"
    puts "To download the book please go to this website: #{book.book_url}"
  end

end
