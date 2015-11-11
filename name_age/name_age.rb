=begin
ask for name
ask for age
ask has celebrated birthday
puts name and year of birth
=end

def input_name_age
	puts "\nWhat is your name?"
	name = gets.chomp.capitalize

	puts "\nWhat is your age?"
	age = gets.chomp.to_i
end

input_name_age
