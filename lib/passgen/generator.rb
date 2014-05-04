require 'securerandom'

module Passgen
    # Generated random password from a wordlist contained in the *options* hash.
	class Generator
		# Holds the generated password(s)
		attr_reader :pass
		# Basic initialization.
		def initialize()
			@pass = nil
		end
		
		# Generate password constrained by the letters contained in acrostic word.
		def gen_acrostic(options)
		  acrostic(options)
		end
		
		# Generates multi word and multiple passwords from a wordlist.
		def gen_multi(options)
		  multi(options)
		end
		
		private
		def acrostic(options)
		    @pass = Array.new
			words = []
			options[:acrostic].each_char do |str|
				loop do 
					word = options[:wordlist].get_word()
					if word[0] == str 
						words << word.chomp
						break
					end
				end
			end
			
			@pass << words
			
		end

		def multi(options)
		    @pass = Array.new
			words = []
			options[:number].downto(1) do
			  options[:count].downto(1) do 
				  word = options[:wordlist].get_word()
				  words << word.chomp
			  end
			  @pass << words
			  words = []
			end
			@pass
		end
		
	end

end