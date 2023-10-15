require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/product_collection'

current_path = File.dirname(__FILE__)

puts 'Вы хотите добавить товар?'
if STDIN.gets.chomp == '+'
  file_path = File.dirname(__FILE__) + '/data/visitka.xml'
  doc = nil

  begin
    file = File.new(file_path)
    doc = REXML::Document.new(file)
    file.close
  rescue
    abort 'File was not found'
  end

  puts 'Какой товар вы хотите добавить?'
  puts 'Book'
  puts 'Movie'
  puts 'Disk'

  choice = STDIN.gets.chomp

  puts 'Укажите стоимость продукта в рублях'
  price = STDIN.gets.chomp

  puts 'Укажите, сколько единиц продукта осталось на складе'
  amount = STDIN.gets.chomp

  products = doc.elements.find('products').first
  product = products.add_element 'product', {
    'price' => price,
    'amount_available' => amount,
  }

  PRODUCT_TYPES = {
    'Book' => Book,
    'Movie' => Film,
    'Disk' => Disk,
  }
  PRODUCT_TYPES[choice].write_product(product)
  
  file = File.new(file_path, 'w:UTF-8')
  doc.write(file, 2)
  file.close
end

collection = ProductCollection.from_dir(current_path + '/data/visitka.xml')
puts collection.sort!(by: 'price', order: '').to_a

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
