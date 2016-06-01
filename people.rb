class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
  def greeting
    "Hi, my name is #{@name}"
  end
end

class Student < Person
  def learn
    "I get it"
  end
end

class Instructor < Person
  def teach
    "Everything in Ruby is an Object"
  end
end

chris = Instructor.new("Chris")
puts chris.greeting

christina = Student.new("Christina")
puts christina.greeting

puts chris.teach
puts christina.learn

# running the below will show an error like this one below. this is because learn is only in the Student class and Teach is only in the Instructor class
# puts chris.learn
# puts christina.teach
# people.rb:32:in `<main>': undefined method `learn' for #<Instructor:0x000000023bf4a0 @name="Chris"> (NoMethodError)
