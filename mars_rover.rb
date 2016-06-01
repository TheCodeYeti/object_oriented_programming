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
  attr_accessor(:x, :y)
  def initialize(coordinates) # expecting array of x,y
    @x = coordinates[0]
    @y = coordinates[1]
  end
end

class Rover
  attr_reader(:x, :y, :direction)
  def initialize(coordinates) # expecting array of x,y,direction
    @x = coordinates[0]
    @y = coordinates[1]
    @direction = coordinates[2]
  end
  def read_instruction(instruction)
    case instruction.upcase
      when "L", "R" then turn(instruction.upcase)
      when "M" then move(instruction.upcase)
    end
  end
  def move
    case @direction
      when "N" then @y += 1
      when "S" then @y -= 1
      when "E" then @x -= 1
      when "W" then @x += 1
    end
  end
  def turn

  end
end

class MissionControl
  def initialize()
  end
end

puts "Please input Martian plateau size in x,y integer format: "
user_input = gets.chomp
mars = Plateau.new(clean_input(user_input)) # create martian plateau

puts "How many Rovers are on Mars? "
user_input = gets.chomp
pathfinder = Rover.new(clean_input(user_input))
