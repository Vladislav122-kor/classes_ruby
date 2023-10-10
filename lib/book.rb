class Book < Product
  attr_accessor :title, :genre, :author

  def self.from_file(path)
    if File.exist?(path)
      data = File.new(path, encoding: 'UTF-8').map { |l| l.chomp }
      attributes = ['title', 'genre', 'author', 'price', 'amount']
      hash = {}

      data.each_with_index { |chank, index| hash[attributes[index].to_sym] = chank.strip }
      self.new(hash)
    else
      puts "File wasn't found. Instance wasn't created."
    end
  end

  def initialize(params)
    super

    @title = params[:title]
    @genre = params[:genre]
    @author = params[:author]
  end

  def to_s
    "Книга «#{@title}», #{@genre}, автор — #{@author}, #{super}"
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @genre = params[:genre] if params[:genre]
    @author = params[:author] if params[:author]
  end
end