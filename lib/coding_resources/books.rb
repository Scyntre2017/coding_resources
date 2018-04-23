class CodingResources::Books

  attr_accessor :name, :desc_url, :short_desc, :long_desc, :book_url

  @@all = []

  def initialize(book_hash)
    @name = book_hash.values_at(:name).join
    @desc_url = book_hash.values_at(:desc_url).join
    @@all << self #unless CodingResources::Books.find_by_name(self.name)
  end

  def self.all
    @@all
  end

  def self.list
    book_1 = self.new({:name => "Hadoop with Python", :desc_url => "http://www.freetechbooks.com/hadoop-with-python-t1346.html" })
    book_1.short_desc = "With this concise book, you'll learn how to use Python with the Hadoop Distributed File System (HDFS), MapReduce, the Apache Pig platform and Pig Latin script, and the Apache Spark cluster-computing framework."
    book_1.long_desc = "Hadoop is mostly written in Java, but that doesn't exclude the use of other programming languages with this distributed storage and processing framework, particularly Python. With this concise book, you'll learn how to use Python with the Hadoop Distributed File System (HDFS), MapReduce, the Apache Pig platform and Pig Latin script, and the Apache Spark cluster-computing framework.Authors Zachary Radtka and Donald Miner from the data science firm Miner & Kasch take you through the basic concepts behind Hadoop, MapReduce, Pig, and Spark. Then, through multiple examples and use cases, you'll learn how to work with these technologies by applying various Python tools."
    book_1.book_url = "http://www.oreilly.com/programming/free/hadoop-with-python.csp"
    self.all
#    self.all.each.with_index(1) do |book, i|
#      puts "#{i}. #{book.name}"
#    end
  end

end
