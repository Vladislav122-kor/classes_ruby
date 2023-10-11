require_relative 'book'
require_relative 'film'

class ProductCollection
  PRODUCT_TYPES = {
    film: {dir: 'films', class: Film},
    book: {dir: 'books', class: Book}
  }

  def initialize(products = [])
    @products = products
  end

  def self.from_dir(dir_path)
    products = []

    PRODUCT_TYPES.each do |type, hash|
      product_dir = hash[:dir]
      product_class = hash[:class]

      Dir[dir_path + '/' + product_dir + '/*.txt'].each do |path|
        products << product_class.from_file(path)
      end
    end

    self.new(products)
  end

  def to_a
    @products
  end

  def sort!(params)
    case params[:by]
    when 'title'
      @products.sort_by! { |product| product.title }
    when 'price'
      @products.sort! { |a, b| a.price.to_i - b.price.to_i }
    when 'amount'
      @products.sort! { |a, b| a.amount.to_i - b.amount.to_i }
    else
      puts "There is no such option for sorting"
    end

    @products.reverse! if params[:order] == 'desc'
    self
  end
end