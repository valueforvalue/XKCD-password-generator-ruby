require 'optparse'
module Passgen
    # Uses optparse to process the command line arguments.
  class Options
    # Holds the default options it is a *Hash*.
    attr_reader :options
    # Loads the option hash with default values to be replaced if 
    # corresponding command line arguments are present.
    # Calls private method parse to get and set the options.
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
      :valid => ".",
      :list => false,
            }
      
      parse(argv)
    end
  private
    
    def parse(argv)
      OptionParser.new do |opts|
      opts.banner = "Usage: passgen [ options ]"
      
      opts.on("-w", "--wordlist filename", String, "Name of wordlist file must be in /res directory") do |w|
        @options[:wordlist] = w
      end
      
      opts.on("-p", "--print [filename]", String, "Print generated passwords to a file") do |f|
        @options[:filename] = f || "output.txt"
        @options[:print] = true
      end
      
      opts.on("-v", "--valid_chars pattern", String, "Valid chars, using regexp style (e.g. '[a-z]')") do |v|
        @options[:valid] = v
      end
      
      opts.on("-g", "--generate", "Generate one random password") do |g|
        @options[:generate] = true
      end
      
      opts.on("-m", "--mini=ARG", String, "Minimum word size for password eg. -m3") do |m|
        @options[:min] = m.to_i
      end
      
      opts.on("-x", "--maxi=ARG", String, "Maximum word size for password eg. -x5") do |m|
        @options[:max] = m.to_i
      end
      
      opts.on("-d", "--delim ARG", String, "Delimiter between words in password eg -d -") do |d|
        @options[:delim] = d
      end
      
      opts.on("--list", "List the wordfiles contained in /res directory for use with the -w option.") do |l|
        @options[:list] = true
      end
      
      opts.on("-a", "--acros word", String, "Word to use as acrostic") do |a|
          if @options[:generate]
          puts "The -g option cannot be set when using acrostic."
          exit(-1)
        else
          @options[:acrostic] = a
        end
      end
      
      opts.on("-c", "--count ARG", String, "Number of words to make random password") do |c|
        @options[:count] = c.to_i
      end
      
      opts.on("-n", "--number ARG", String, "Number of passwords to generate") do |n|
        @options[:number] = n.to_i
      end
      
      opts.on_tail("--version", "Show version information about this program and quit.") do
        puts "\n"
              puts "Passgen v0.0.1 alpha"
              exit
            end
      
      opts.on("-h", "--help", String, "Show options.") do 
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