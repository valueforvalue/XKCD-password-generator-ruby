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
						words << word.strip()
						break
					end
				end
			end
			
			@pass = words
			
		end
		
	end

end