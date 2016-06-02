# sales tax = 10% on everything except books, food, medical products
# additional 5% import duty on anything imported

class CartItem
  attr_reader :count, :name, :price, :sales_tax_exempt, :imported
  def initialize(user_input)
    parsed_input = parse_input(user_input)
    @count = parsed_input[:item_count]
    @name = parsed_input[:item_name]
    @price = parsed_input[:item_price]
    sales_tax_exempt?
    imported?
  end
  def parse_input(user_input)
    # split the first item off the string - should be a number
    # temp_var = []
    temp_var = user_input.split(' ', 2)
    result = Hash.new
    result[:item_count] = temp_var[0].to_i
    #split the remaining string based on the " at "
    temp_var = temp_var[1].split(" at ")
    result[:item_name] = temp_var[0]
    result[:item_price] = temp_var[1].to_f
    result

  end
  def sales_tax_exempt?
    @sales_tax_exempt = false
    exempt_items = ["books", "food", "medical", "chocolate", "coffee", "pills"]
    exempt_items.each do |exempt_item|
      @sales_tax_exempt = true if @name.include? exempt_item
    end
  end
  def imported?
    @imported = false
    @imported = true if @name.include? "imported"
  end
end

class ShoppingCart
  def initialize
    @items = []
    response = "Y"
    while response == "Y" do
      puts "Would you like to add an item? (Y/N) "
      response = gets.chomp.upcase
      add_item if response == "Y"
    end

  end

  def add_item
    puts "Please input the first item with the following format where # is a number:"
    puts "# item_name at ##.##"
    puts ""
    user_input = gets.chomp
    item = CartItem.new(user_input)
    @items << item
    list_items
  end

  def list_items
    puts ""
    puts "Your cart:"
    @items.each do |item|
      puts "#{item.count} #{item.name}: #{'%.02f' % item.price}"
    end
    sales_tax = calculate_sales_tax
    puts "Sales Taxes: #{'%.02f' % sales_tax}"
    import_tax = calculate_import_tax
    puts "Import Taxes: #{'%.02f' % import_tax}"
    total = calculate_total(sales_tax, import_tax)
    puts "Total: #{'%.02f' % total}"
  end

  def calculate_total(sales_tax, import_tax)
    total = 0.to_f
    @items.each do |item|
      total += item.price
    end
    total += sales_tax
    total += import_tax
  end

  def calculate_sales_tax
    total_sales_tax = 0.to_f
    @items.each do |item|
      total_sales_tax += item.price * 0.10 unless item.sales_tax_exempt
    end
    total_sales_tax
  end

  def calculate_import_tax
    total_import_tax = 0.to_f
    @items.each do |item|
      total_import_tax += item.price * 0.05 if item.imported
    end
    total_import_tax
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
