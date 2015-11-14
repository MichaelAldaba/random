require_relative '../person'

describe "#new" do
	it "should create a new person instance" do
		person = Person.new("Rich")
		expect(person)
	end
end

describe "#first_name" do
	it "should have a first name" do
		person = Person.new("Rich")
		expect(person.first_name).to eql("Rich")
	end

	it "should not have a default" do
		person = Person.new("Bob")
		expect(person.first_name).not_to eql("Rich")
	end
end

describe "#age" do
	it "should have an age" do
		person = Person.new("Bob", 25)
		expect(person.age).to be(25)
	end

	it "should default to 0" do
		person = Person.new("Bob")
		expect(person.age).to be(0)
	end
end

