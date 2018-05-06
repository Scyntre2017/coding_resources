class CodingResources::Scraper

  def self.scrape_all_books
    page = 0
    books = []
    while page < 82
      page += 1
      doc = Nokogiri::HTML(open("http://www.freetechbooks.com/topics?page=#{page}"))
      doc.css(".media-body").each do |book|
        binding.pry
        name = book.css("p.media-heading").text
        desc_url = book.css("a").first.attribute("href").value
        short_desc = book.text (/[^rnt\\]+[a-zA-Z\d.:]+/)
        # take off the end of the text (/(Publisher).+$/)
        # take off the beginning of the text (/^.+\d{4}\s/)
        books << {name: name, desc_url: desc_url}
      end
      binding.pry
    end

    books
  end

  def self.scrape_book_details(url)
    puts "I scrape book details"
  end

end
