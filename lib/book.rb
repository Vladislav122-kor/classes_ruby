class Book < Product
  attr_accessor :title, :genre, :author

  def self.from_file(node, opts)
    other_opts = {
      title: node.attributes["title"],
      genre: node.attributes["genre"],
      author: node.attributes["author_name"],
    }

    self.new(other_opts.merge(opts))
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