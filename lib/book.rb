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

  def self.write_product(product)
    puts 'Укажите название книги'
    title = STDIN.gets.chomp

    puts 'Укажите жанр книги'
    genre = STDIN.gets.chomp

    puts 'Укажите автора'
    author = STDIN.gets.chomp

    product.add_element 'book', {
      'title' => title,
      'genre' => genre,
      'author_name' => author,
    }
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