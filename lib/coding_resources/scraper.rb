class CodingResources::Scraper

  def self.scrape_all_books
    page = 0
    books = []
    while page < 82
      page += 1
      doc = Nokogiri::HTML(open("http://www.freetechbooks.com/topics?page=#{page}"))
      doc.css(".media-body").each do |book|
        name = book.css("p.media-heading").text
        desc_url = book.css("a").first.attribute("href").value
        short_desc = book.text.gsub("\r", "").gsub("\n", "").gsub("\t", "").gsub(/(Publisher).+$/, "").gsub(/^.+\d{4}/, "")
        books << {name: name, desc_url: desc_url, short_desc: short_desc}
      end
    end

    books
  end

  def self.scrape_book_details(url)
    puts "I scrape book details"
  end

end
