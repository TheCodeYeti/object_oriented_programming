# x(-1 to 1) = East to West
# y(-1 to 1) = South to North

def clean_input(user_input)
  if user_input.include? ","
    cleaned_input = user_input.split(",")
  else
    cleaned_input = user_input.split(" ")
  end
  cleaned_input
end



puts "Please input plateau size in x,y integer format:"
user_input = gets.chomp
cleaned_input = clean_input(user_input)

# plateau_size.map! {|coordinate|  coordinate.tr(", ","")}
puts plateau_size
