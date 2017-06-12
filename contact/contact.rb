require "./phone"
class Contact
	attr_writer :first_name, :middle_name, :last_name
	attr_reader :phone_numbers

	def initialize
		@phone_numbers = []
	end

	def add_phone_number(kind, number)
		phone_number = Phone.new
		phone_number.kind = kind
		phone_number.number = number
		phone_numbers.push(phone_number)
	end

	def first_name
		@first_name
	end

	def middle_name
		@middle_name
	end

	def last_name
		@last_name
	end

	def last_first
		name = full_name.split(/\W+/)
		name.reverse.join(" ")
	end

	def full_name
		full_name = first_name
		if !@middle_name.nil?
			full_name += ' ' + middle_name
		end
		full_name += ' ' + last_name
		full_name
	end

	def to_s(format = 'full_name')
		case format
		when 'full_name'
			full_name
		when 'last_first'
			last_first
		when 'first'
			full_name
		when 'last'
			last_first
		else
			full_name
		end
	end

	def print_phone_numbers
		puts "Phone Numbers"
		phone_numbers.each { | phone | puts phone}
	end

end

justin = Contact.new
justin.first_name = "Justin"
justin.middle_name = "Conrad"
justin.last_name = "Voelkel"
justin.add_phone_number("Home", "4402896190")
justin.add_phone_number("Cell", "4402896190")

puts justin.to_s('last')
justin.print_phone_numbers
