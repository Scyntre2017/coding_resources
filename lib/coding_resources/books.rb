class CodingResources::Books

  attr_accessor :name, :url

  @@all = []

  def initialize(book_hash)
    @name = book_hash.values_at(:name).join
    @url = book_hash.values_at(:url).join
    @@all << self unless CodingResources::Books.find_by_name(self.name)
  end

  def self.all
    @@all
  end

  def self.list
    self.all.each.with_index(1) do |book, i|
      puts "#{i}. #{book.name}"
    end
  end

end
