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

  def self.create_pages(books)
    if books == "all_books"
      self.pages = self.all.each_slice(3).to_a
    end
  end

  def self.create_all_books
    book_array = CodingResources::Scraper.scrape_all_books
    self.create_from_collection(book_array)
    self.create_pages("all_books")
  end

  def self.search(name)
    #should search through all books in order to find books that match the search.
    puts "method is working #{name}"
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
  end

end
