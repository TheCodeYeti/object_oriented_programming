# sales tax = 10% on everything except books, food, medical products
# additional 5% import duty on anything imported

def parse_input(user_input)
  # split the first item off the string - should be a number
  temp_var = user_input.split(" ", 2)
  result = {}
  result[:item_count] = temp_var[0]
  return result
  #split the remaining string based on the " at "
  temp_var = temp_var[1].split(" at ")
  result[:item_name] = temp_var[0]
  result[:item_price] = temp_var[1].to_f
  result
end

puts "Welcome to Wawa's shop! We have everything you're looking for. Please input the items for your first transaction:"
puts "Please input the first item with the following format where # is a number:"
puts "# item_name at ##.##"
puts
user_input = gets.chomp
puts parse_input(user_input)
