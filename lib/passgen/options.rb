require 'optparse'
module Passgen
	class Options
		attr_reader :options
		def initialize(argv)
			@options = { :wordlist => "test.txt",
            :min => 3,
            :max => 5,
            :count => 4,
			:generate => false,
			:delim => " ",
			:number => 1,
			:filename => "output.txt",
			:print => false,
            }
			
			parse(argv)
		end
	private
		
		def parse(argv)
			OptionParser.new do |opts|
			opts.banner = "Usage: passgen [ options ] acrostic..."
			
			opts.on("-w", "--wordlist filename", String, "name of wordlist file must be in /res directory") do |w|
				@options[:wordlist] = w
			end
			
			opts.on("-p", "--print [filename]", String, "Print generated passwords to a file") do |f|
				@options[:filename] = f || "output.txt"
				@options[:print] = true
			end
			
			opts.on("-g", "--generate", "generate one random password") do |g|
				@options[:generate] = true
			end
			
			opts.on("-m", "--mini=ARG", String, "minimum word size for password eg. -m3") do |m|
				@options[:min] = m.to_i
			end
			
			opts.on("-x", "--maxi=ARG", String, "maximum word size for password eg. -x5") do |m|
				@options[:max] = m.to_i
			end
			
			opts.on("-d", "--delim ARG", String, "delimiter between words in password eg -d -") do |d|
				@options[:delim] = d
			end
			
			opts.on("-a", "--acros word", String, "word to use as acrostic") do |a|
				@options[:acrostic] = a
			end
			
			opts.on("-c", "--count ARG", String, "number of words to make random password") do |c|
				@options[:count] = c.to_i
			end
			
			opts.on("-n", "--number ARG", String, "number of passwords to generate") do |n|
				@options[:number] = n.to_i
			end
			
			opts.on("-h", "--help", String, "Show this message") do 
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
			@options
		end
	end
end