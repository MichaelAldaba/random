=begin
iterate from 1-100
if divisible by 3, puts fizz
if divisible by 5, puts buzz
if divisible by both, puts fizzbuzz
else puts number
=end

def fizzbuzz
	(1..100).each { |n| n % 3 == 0 ? (n % 5 == 0 ? (puts "FizzBuzz") : (puts "Fizz")) : (n % 5 == 0 ? (puts "Buzz") : (puts n))}
end

fizzbuzz