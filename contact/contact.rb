class Contact
	attr_writer :first_name, :middle_name, :last_name

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
end

justin = Contact.new
justin.first_name = "Justin"
justin.middle_name = "Conrad"
justin.last_name = "Voelkel"

puts justin.to_s('last')
