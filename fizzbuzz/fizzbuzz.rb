=begin
for each number(n) from 1-100
	is n divisible by 3?
		if yes, is n also divisible by 5?
			if yes, puts "FizzBuzz"
			if no, puts "Fizz"
		if no, is n divisible by 5?
			if yes, puts "Buzz"
			if no, puts n
=end

(1..100).each { |n| n % 3 == 0 ? (n % 5 == 0 ? (puts "FizzBuzz") : (puts "Fizz")) : (n % 5 == 0 ? (puts "Buzz") : (puts n))}