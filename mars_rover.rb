# x(-1 to 1) = East to West
# y(-1 to 1) = South to North


puts "Please input plateau size in x,y integer format:"
user_input = gets.chomp
plateau_size = user_input.partition(/.,/)

plateau_size.map! {|coordinate|  coordinate.tr(",","")}
