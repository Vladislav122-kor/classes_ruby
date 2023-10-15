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