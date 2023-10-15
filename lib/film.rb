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
  