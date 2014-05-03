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
		end
		
		# Public wrapper method to generate a wordlist for random password creation.
		# This method must be called explicitly.
		def create(options)
          generate_wordlist(options)		
		end
		
		private
		
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
	end

end