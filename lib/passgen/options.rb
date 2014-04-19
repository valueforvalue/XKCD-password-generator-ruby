require 'optparse'
module Passgen
	class Options
		DEFAULT_WORDLIST = "/res/2of12.txt"
		attr_reader :options
		def initialize(argv)
			@options = {} 
			@options[:wordlist] = DEFAULT_WORDLIST
			@options[:acrostic] = nil
			@options[:min] = 3
			@options[:max] = 5
			parse(argv)
			
		end
	private
		
		def parse(argv)
			OptionParser.new do |opts|
			opts.banner = "Usage: passgen [ options ] acrostic..."
			
			opts.on("-w", "--wlist path", String, "Path to wordlist") do |w|
				@options[:wordlist] = w
			end
			
			opts.on("-s", "--single", "Generate one random word.") do |s|
				@options[:single] = true
			end
			
			opts.on("-m=ARG", String, "Min/Max word size in form 6-10") do |m|
				min, max = m.split("-")
				@options[:min], @options[:max] = min.to_i , max.to_i
			end
			
			opts.on("-a", "--acros word", String, "Word to use as acrostic") do |a|
				@options[:acrostic] = a
			end
			
			opts.on("-h", "--help", String, "Show this message") do |h|
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