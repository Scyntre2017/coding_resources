class CodingResources::Scraper

  def self.scrape_all_books
    page = 0
    books = []
    while page < 82
      doc = Nokogiri::HTML(open("http://www.freetechbooks.com/topics?page=#{page++}"))
      binding.pry
    end

    books
  end

  def self.scrape_book_details(url)
    puts "I scrape book details"
  end

end
