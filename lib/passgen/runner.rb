require_relative 'wordlist'
require_relative 'options'
require_relative 'generator'

module Passgen
	class Runner
		def initialize(argv)
			@options = Options.new(argv)
		end
		
		def run()
			wordlist = Wordlist.new(@options.wordlist)
			wordlist::create()
			generator = Generator.new()
			
			if @options.acrostic
				generator::gen_acrostic(wordlist.list, @options.acrostic)
			else
				generator::gen_single(wordlist.list)
			end
			print generator.pass
		end
		
	end

end