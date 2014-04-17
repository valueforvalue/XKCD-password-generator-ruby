require 'optparse'
module Passgen
	class Options
		DEFAULT_WORDLIST = "/res/2of12.txt"
		attr_reader :wordlist, :acrostic
		def initialize(argv)
			@wordlist = DEFAULT_WORDLIST
			parse(argv)
			@acrostic = argv
		end
	private
		
		def parse(argv)
			OptionParser.new do |opts|
			opts.banner = "Usage: passgen [ options ] acrostic..."
			
			opts.on("-w", "--wlist path", String, "Path to wordlist") do |wlist|
				@wordlist = wlist
			end
				begin
					argv = ["-h"] if argv.empty?
					opts.parse!(argv)
				rescue OptionParser::ParseError => e
					STDERR.puts e.message, "\n" ,opts
					exit(-1)
				end
			end
		end
	end
end