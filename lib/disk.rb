class Disk < Product
  attr_accessor :album, :artist, :genre
  
  def self.from_file(node, opts)
    other_opts = {
      album: node.attributes["album_name"],
      artist: node.attributes["artist_name"],
      genre: node.attributes["genre"],
    }
  
    self.new(other_opts.merge(opts))
  end

  def self.write_product(product)
    puts 'Укажите название альбома'
    album = STDIN.gets.chomp

    puts 'Укажите исполнителя'
    artist = STDIN.gets.chomp

    puts 'Укажите жанр'
    genre = STDIN.gets.chomp

    product.add_element 'book', {
      'album__name' => album,
      'artist_name' => artist,
      'genre' => genre,
    }
  end
  
  def initialize(params)
    super
  
    @album = params[:album]
    @artist = params[:artist]
    @genre = params[:genre]
  end
  
  def to_s
    "Диск «#{@album}», #{@artist}, автор — #{@genre}, #{super}"
  end
  
  def update(params)
    super
  
    @album = params[:album] if params[:album]
    @artist = params[:artist] if params[:artist]
    @genre = params[:genre] if params[:genre]
  end
end