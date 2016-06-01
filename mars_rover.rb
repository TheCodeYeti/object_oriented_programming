# x(-1 to 1) = East to West
# y(-1 to 1) = South to North

def clean_input(user_input)
  if user_input.include? ","
    cleaned_input = user_input.split(",")
  elsif user_input.include? " "
    cleaned_input = user_input.split(" ")
  end
  cleaned_input
end

def can_be_int?(input)
  if !!/\A\d+\z/.match(input)
    return true
  else
    return false
  end
end


class Plateau
  attr_accessor(:x, :y)
  def initialize(coordinates) # expecting array of x,y
    @x = coordinates[0]
    @y = coordinates[1]
  end
end

class Rover
  attr_reader(:x, :y, :direction, :name)
  def initialize(coordinates, name) # expecting array of x,y,direction
    @name = name
    @x = coordinates[0]
    @y = coordinates[1]
    @direction = coordinates[2]
  end
  def read_instruction(instruction)
    case instruction.upcase
      when "L", "R" then turn(instruction)
      when "M" then move
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
    # maybe use an array as a compass
  end
end

class MissionControl
  attr_accessor :rover_count
  def initialize(plateau_coordinates)
    @mars = Plateau.new(plateau_coordinates)

    puts "How many rovers are on Mars? "
    rover_count = gets.chomp.to_i
    @rovers = []
    rover_count.times do |rover_num|
      puts "Give me rover##{rover_num + 1}'s name: "
      rover_name = gets.chomp
      puts "Give me #{rover_name}'s coordinates in x,y,d format where x and y are the coordinates and d is the direction #{rover_name} is facing (N,S,E,W): "
      rover_coordinates = gets.chomp
      rover = Rover.new(clean_input(rover_coordinates), rover_name)
      @rovers << rover
    end
  end

  def list_rovers
    puts "There are #{@rovers.count} rovers on the Matrian Plateau"
    @rovers.each do |rover|
      puts "#{rover.name}=> X:#{rover.x} Y:#{rover.y} Facing:#{rover.direction}"
    end
  end

  def get_rover(rover_name)
    @rovers.each do |rover|
      if rover.name = rover_name then
        puts "Rover #{rover.name} found! Connect to #{rover.name}? (Y/N)"
        connect = gets.chomp.upcase
        connect_to(rover) if connect = "Y"
      end
    end
  end

  def connect_to(rover)
    puts "#{rover.name} ready for instructions: "
  end

  def send_instructions(rover, instructions)
  end

end

puts "Come in Mission Control... Initializing connection..."
puts "Mission Control, Please input Martian plateau size in x,y integer format: "
user_input = gets.chomp
houston = MissionControl.new(clean_input(user_input))
houston.list_rovers

puts "Type in a rover to send instruction to: "
user_input = gets.chomp


#
# user_input = gets.chomp
# mars = Plateau.new(clean_input(user_input)) # create martian plateau
#



# pathfinder = Rover.new(clean_input(user_input))
