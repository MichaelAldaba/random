# method from previous exercise

def celsius_to_fahrenheit(celsius)
	answer = (celsius * 1.8 + 32).round
	puts "\n#{celsius} °C = #{answer} °F"
end

def input_to_fahrenheit
	puts "\nEnter the temperature in degrees Celsius, please."
	answer = gets.chomp
	celsius_to_fahrenheit(answer.to_i)
end

input_to_fahrenheit

puts ""