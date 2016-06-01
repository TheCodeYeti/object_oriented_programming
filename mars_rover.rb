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

class Plateau
  def initialize(coordinates) # expecting array of x,y
    @x = coordinates[0]
    @y = coordinates[1]
  end
end

class Rover
  def initialize(coordinates) # expecting array of x,y,direction
    @x = coordinates[0]
    @y = coordinates[1]
    @direction = coordinates[2]
  end
end

puts "Please input plateau size in x,y integer format:"
user_input = gets.chomp
cleaned_input = clean_input(user_input)

# plateau_size.map! {|coordinate|  coordinate.tr(", ","")}
mars = Plateau.new(cleaned_input)
