# define method
def celsius_to_fahrenheit(celsius)
	answer = (celsius * 1.8 + 32).round
	puts "\n#{celsius} °C = #{answer} °F"
end

# call method
celsius_to_fahrenheit(100)

puts ""