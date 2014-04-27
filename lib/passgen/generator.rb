module Passgen
	class Generator
		attr_reader :pass
		def initialize()
			@pass = []
		end
		
		def gen_acrostic(options)
			words = []
			list = options[:wordlist]
			options[:acrostic].each_char do |str|
				loop do 
					word = list[rand(list.length)]
					if word[0] == str 
						words << word.chomp
						break
					end
				end
			end
			
			@pass << words
			
		end
		
		def gen_multi(options)
			words = []
			list = options[:wordlist]
			options[:number].downto(1) do
			  options[:count].downto(1) do 
				  word = list[rand(list.length)]
				  words << word.chomp
			  end
			  @pass << words
			  words = []
			end
			@pass
		end
		
	end

end