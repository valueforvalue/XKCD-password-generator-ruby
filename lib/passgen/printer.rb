module Passgen
	class Printer
		attr_reader :pass
		def initialize(pw, delim="-")
			@pass = pw
			@delim = delim
			case pw
			when String
				print_string()
			when Array
				print_array
			else
			puts "Unknown returned password value."
			end
		end
		
		
		def print_string()
			puts "Password: #{@pass}"
		end
		
		def print_array()
			@pass = @pass.join(@delim)
			puts "Password: #{@pass}"
		end
		
	end

end