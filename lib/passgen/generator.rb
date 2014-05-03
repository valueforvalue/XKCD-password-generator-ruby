require 'securerandom'

module Passgen
    # Generated random password from a wordlist contained in the *options* hash.
	class Generator
		# Holds the generated password(s)
		attr_reader :pass
		# Basic initialization.
		def initialize()
			@pass = []
		end
        # Generate password constrained by the letters contained in acrostic word.
		def gen_acrostic(options)
			words = []
			list = options[:wordlist]
			options[:acrostic].each_char do |str|
				loop do 
					word = list[SecureRandom.random_number(list.length)]
					if word[0] == str 
						words << word.chomp
						break
					end
				end
			end
			
			@pass << words
			
		end
		# Generates multi word and multiple passwords from a wordlist.
		def gen_multi(options)
			words = []
			list = options[:wordlist]
			options[:number].downto(1) do
			  options[:count].downto(1) do 
				  word = list[SecureRandom.random_number(list.length)]
				  words << word.chomp
			  end
			  @pass << words
			  words = []
			end
			@pass
		end
		
	end

end