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
        books << {name: name, desc_url: desc_url}
      end
    end

    books
  end

  def self.scrape_book_details(url)
    details = {}
    doc = Nokogiri::HTML(open(url))
    details[:description] = doc.css("blockquote").text
    details[:book_url] = doc.css("#srvata-content a").attribute("href").value
    details
  end

end
