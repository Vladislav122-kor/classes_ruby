require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/product_collection'

current_path = File.dirname(__FILE__)

collection = ProductCollection.from_dir(current_path + '/data')
puts collection.sort!(by: 'amount', order: 'asc').to_a

# collection.to_a.each { |product| puts product }

# film = Film.from_file("#{current_path}/data/films/01.txt")
# book = Book.from_file("#{current_path}/data/books/01.txt")

# puts film
# puts book

# begin
#   Product.from_file(current_path + '/data/films/01.txt')
# rescue NotImplementedError
#   puts 'Method for class Product.from_file is not implemented'
# end
