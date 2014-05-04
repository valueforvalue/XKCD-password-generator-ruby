module Passgen
    # The Wordlist class creates wordlists according to its default settings
	# or command line options given.
	#	
	class Wordlist
		# Contains a reference to the generated wordlist.
		attr_accessor :list
		# Contains the path to the current wordfile.
		attr_reader :path
		# Sets up the wordlist generation process, takes the options hash and passes it to private methods.
		def initialize(options)
			@list = nil
			@path = nil
			make_path(options)
			create(options)
		end
		
		# Public wrapper method to generate a wordlist for random password creation.
		def create(options)
          generate_wordlist(options)		
		end
		
		# Returns a random word from the created wordlist.
		def get_word()
		  return_word()
		end
		
		# Returns the generated wordlists length.
		def length()
		  @list.length
		end
		# Prints a list of the wordfiles to be used with the -w option.
		def print_wordfiles
		  puts "\n"
		  puts "Wordfiles avaliable for use:"
		  puts "\n"
		  get_wordfile_names().each do |filename|
		    puts filename
		  end
		end
		
		private
		
		def return_word()
		  @list[SecureRandom.random_number(@list.length)]
		end
		
		def generate_wordlist(options)
			a = []
			pattern = "^#{options[:valid]}{#{options[:min]},#{options[:max]}}$"
			regex = /#{pattern}/
			File.open(path) do |f|
			  f.lines.each do |line|
			  match = regex.match(line)
				  if match
						  a << line
				  end
			  end
			end
			
			
			
			if a.length < options[:count]
			  puts "\n"
			  puts "Unable to generate password containing #{options[:count]} words. \n"
			  puts "Parameters may be too strict or wordlist is too small. \n"
			  exit(-1)
			else
			  self.list = a
			  shuffle_list()
			end
		end
		
		def shuffle_list()
		    self.list = self.list.shuffle
		end
		

		
		def make_path(options)
		  fn = options[:wordlist]
		  temp = File.expand_path File.dirname(__FILE__) + "/res/"
		  @path = File.join(temp, fn)
		end
		
		def get_wordfile_dir
		  temp = File.expand_path File.dirname(__FILE__) + "/res/"
		  Dir.new(temp)
		end
		
		def get_wordfile_names
		  Dir.chdir(get_wordfile_dir())
		  wordfiles = Dir.glob("*.txt")
		end
	end

end