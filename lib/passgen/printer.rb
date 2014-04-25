module Passgen
	class Printer
		attr_reader :pass
		def initialize(options)
			@temp = options[:password]
			@pass = []
			@delim = options[:delim]
			print_array(options)
		end
		
		
		
		def print_array(options)
			@temp.each do |x|
			  word = x.join(@delim)
			  @pass << word
			end
			puts "Password(s):"
			@pass.each do |p|
			  puts "#{p} \n"
			end
			
			if options[:print]
			  print_to_file(options)
			end
			
		end
		
		private
		def print_to_file(options)
		    File.open(options[:filename], "w") do |f|
			  f.puts(@pass)
			end
			

		end
		
	end

end