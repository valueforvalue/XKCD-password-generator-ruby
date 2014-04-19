require_relative 'wordlist'
require_relative 'options'
require_relative 'generator'

module Passgen
	class Runner
		def initialize(argv)
			@cmd = Options.new(argv)
		end
		
		def run()
			wordlist = Wordlist.new(@cmd.options[:wordlist])
			wordlist::create(@cmd.options[:min], @cmd.options[:max])
			generator = Generator.new()
			
			if @cmd.options[:single]
				generator::gen_single(wordlist.list)
			elsif @cmd.options[:acrostic]
				generator::gen_acrostic(wordlist.list, @cmd.options[:acrostic])
				
			else 
				puts "Command slipped through."
			end
			print generator.pass
		end
		
	end

end