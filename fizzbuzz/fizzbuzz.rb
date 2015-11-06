=begin
iterate from 1-100
if divisible by 3, puts fizz
if divisible by 5, puts buzz
if divisible by both, puts fizzbuzz
else puts number
=end

def fizzbuzz
	(1..100).each do |n|
		output = ""
		output = "Fizz" if n % 3 == 0
		output += "Buzz" if n % 5 == 0
		output.length > 0 ? (puts output) : (puts n)
	end
end

fizzbuzz