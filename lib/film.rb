class Film < Product
  attr_accessor :title, :year, :director

  def self.from_file(path)
    if File.exist?(path)
      data = File.new(path, encoding: 'UTF-8').map { |l| l.chomp }
      attributes = ['title', 'year', 'director', 'price', 'amount']
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
    @year = params[:year]
    @director = params[:director]
  end

  def to_s
    "Фильм «#{@title}», #{@year}, реж. #{@director}, #{super}"
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @year = params[:year] if params[:year]
    @director = params[:director] if params[:director]
  end
end
  