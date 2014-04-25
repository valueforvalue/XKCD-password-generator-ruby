require 'passgen/wordlist'
require 'passgen/options'
require 'passgen/generator'
require 'passgen/printer'

module Passgen
	class Runner
		def initialize(argv)
			@opts = Options.new(argv)
			@cmd = @opts.options
			puts @cmd.inspect
		end
		
		def run()
			wordlist = Wordlist.new(@cmd)
			wordlist::create(@cmd)
			@cmd[:wordlist] = wordlist.list
			generator = Generator.new()
			
			if @cmd[:generate]
			  generator::gen_multi(@cmd)
			elsif @cmd[:acrostic]
			  generator::gen_acrostic(@cmd)
			end
			
			if generator.pass
			  @cmd[:password] = generator.pass
			  Printer.new(@cmd)
			end
			
		end
		
	end

end