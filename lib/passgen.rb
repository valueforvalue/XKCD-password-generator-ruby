require 'passgen/wordlist'
require 'passgen/options'
require 'passgen/generator'
require 'passgen/printer'

# Module that wraps all of Passgens functionality in a single package.
module Passgen

    # The runner class sews all other classes together.
	# It calls the option parser on *ARGV* to procces command line options.
	class Runner
	    # Sets up option parsing.
		def initialize(argv)
			@opts = Options.new(argv)
			@cmd = @opts.options
		end
		
		
		# Driver code for passgen.
		#
		# The *run* method takes care of init,
		# and calls the generator method that is applicable 
		# based on the command line args.
		#
		def run()
			wordlist = Wordlist.new(@cmd)
			@cmd[:wordlist] = wordlist
			generator = Generator.new()
			
			if @cmd[:list]
			  wordlist::print_wordfiles
			end
			
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