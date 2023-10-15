require_relative 'book'
require_relative 'film'
require_relative 'disk'
require 'rexml/document'

class ProductCollection
  PRODUCT_TYPES = [
    {dir: 'movie', class: Film},
    {dir: 'book', class: Book},
    {dir: 'disk', class: Disk},
  ].freeze

  def initialize(products = [])
    @products = products
  end

  def self.from_dir(dir_path)
    products = []
    file = File.new(dir_path)
    doc = REXML::Document.new(file)

    PRODUCT_TYPES.each do |hash|
      doc.elements.each("products/product/#{hash[:dir]}") do |node|
        opts = {
          price: node.parent.attributes["price"].to_i,
          amount: node.parent.attributes["amount_available"].to_i,
        }
        
        products << hash[:class].from_file(node, opts)
      end
    end

    self.new(products)
  end

  def to_a
    @products
  end

  def sort!(params)
    case params[:by]
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
