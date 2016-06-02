# sales tax = 10% on everything except books, food, medical products
# additional 5% import duty on anything imported

class CartItem
  attr_reader :count, :name, :price
  def initialize(user_input)
    parsed_input = parse_input(user_input)
    @count = parsed_input[:count]
    @name = parsed_input[:name]
    @price = parsed_input[:price]
    @items = []
  end
  def parse_input(user_input)
    # split the first item off the string - should be a number
    temp_var = user_input.split(" ", 2)
    result = Hash.new
    result[:count] = temp_var[0]
    #split the remaining string based on the " at "
    temp_var = temp_var[1].split(" at ")
    result[:name] = temp_var[0]
    result[:price] = temp_var[1].to_f
    result
  end
end

class ShoppingCart
  def initialize
    response = "Y"
    while response == "Y" do
      puts "Would you like to add an item? (Y/N) "
      response = gets.chomp.upcase
      add_item if response = "Y"
    end

  end

  def add_item
    puts "Please input the first item with the following format where # is a number:"
    puts "# item_name at ##.##"
    puts ""
    user_input = gets.chomp
    @items = CartItem.new(user_input)
  end
end

puts "Welcome to Wawa's shop! We have everything you're looking for, coffee, chocolate, more coffee...EVERYTHING! "
puts "Would you like to shop at my store? (Y/N) "
response = gets.chomp.upcase
while response == "Y" do
  my_cart = ShoppingCart.new
  puts "Would you like to keep shopping? (Y/N) "
  response = gets.chomp.upcase
end
puts "That's ok, more coffee for me!"

# puts "Please input the items for your first transaction:"
# puts "Please input the first item with the following format where # is a number:"
# puts "# item_name at ##.##"
# puts ""
# user_input = gets.chomp
# first_item = CartItem.new(user_input)
