require 'optparse'
module Passgen
	class Options
		DEFAULT_WORDLIST = File.join(File.expand_path File.dirname(__FILE__), "/res/2of12.txt")
		attr_reader :wordlist, :acrostic
		def initialize(argv)
			@wordlist = DEFAULT_WORDLIST
			@acrostic = nil
			parse(argv)
			
		end
	private
		
		def parse(argv)
			OptionParser.new do |opts|
			opts.banner = "Usage: passgen [ options ] acrostic..."
			
			opts.on("-w", "--wlist path", String, "Path to wordlist") do |wlist|
				@wordlist = wlist
			end
			
			opts.on("-a", "--acros word", String, "Word to use as acrostic") do |acros|
				@acrostic = acros
			end
			
			opts.on("-h", "--help", String, "Show this message") do |wlist|
				puts opts
				exit
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