=begin
iterate from 1-100
if divisible by 3, puts fizz
if divisible by 5, puts buzz
if divisible by both, puts fizzbuzz
else puts number
=end

def fizzbuzz
	(1..100).each do |n|
		if n % 3 == 0 && n % 5 == 0
			puts "FizzBuzz"
		elsif n % 3 == 0
			puts "Fizz"
		elsif n % 5 == 0
			puts "Buzz"
		else
			puts n
		end
	end
end

fizzbuzz