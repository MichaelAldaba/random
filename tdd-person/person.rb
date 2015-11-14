class Person
	attr_reader :first_name, :age

	def initialize(first_name, age=0)
		@first_name = first_name
		@age = age
		end

end