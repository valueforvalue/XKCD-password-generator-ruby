module Passgen
	class Generator
		attr_reader :pass
		def initialize()
			@pass = nil
		end
		
		def gen_single(wordlist)
			@pass = wordlist[rand(wordlist.length)]
		end
		
		def gen_acrostic(wordlist, acrostic)
			words = []
			acrostic.each_char do |str|
				loop do 
					word = wordlist[rand(wordlist.length)]
					if word[0] == str 
						words << word.chomp
						break
					end
				end
			end
			
			@pass = words
			
		end
		
		def gen_multi(wordlist, count)
			words = []
			count.downto(1) do 
				word = wordlist[rand(wordlist.length)]
				words << word.chomp
			end
			@pass = words
		end
		
	end

end