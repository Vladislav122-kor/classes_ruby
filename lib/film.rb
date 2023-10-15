class Film < Product
  attr_accessor :title, :year, :director

  def self.from_file(node, opts)
    other_opts = {
      title: node.attributes["title"],
      year: node.attributes["year"],
      director: node.attributes["director_name"],
    }

    self.new(other_opts.merge(opts))
  end

  def self.write_product(product)
    puts 'Укажите название фильма'
    title = STDIN.gets.chomp

    puts 'Укажите год выпуска'
    year = STDIN.gets.chomp

    puts 'Укажите продюссера'
    director = STDIN.gets.chomp

    product.add_element 'book', {
      'title' => title,
      'year' => year,
      'director_name' => director,
    }
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
  