class CodingResources::Books

  attr_accessor :name, :desc_url, :short_desc, :long_desc, :book_url

  @@all = []
  @@pages = []

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

  def self.pages
    @@pages
  end

  def self.pages=(pages)
    @@pages = pages
  end

  def self.pages_clear
    @@pages.clear
  end

  def self.create_all_books
    book_array = CodingResources::Scraper.scrape_all_books
    self.create_from_collection(book_array)
  end

  def self.search(name)
    #should search through all books in order to find books that match the search.
    puts "method is working #{name}"
  end

  def self.list
    self.pages = self.all.each_slice((self.all.size/5.to_f).round).to_a
    #should return 25 books at a time until all books have been returned
    self.all.each.with_index(1) do |book, i|
      puts "#{i}. #{book.name}"
      puts "#{book.short_desc}"
    end
  end

  def self.find_by_name(name)
    self.all.detect { |i| i.name == name  }
  end

  def self.next_page
    #should cycle through the arrays of books created by the pages method.
  end

  def details
    CodingResources::Scraper.scrape_book_details(self.desc_url)
    puts "Book details"
  end

end
