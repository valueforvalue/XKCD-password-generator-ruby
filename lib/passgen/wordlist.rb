module Passgen
	class Wordlist
		attr_reader :list, :path
		attr_writer :list
		def initialize(options)
			@list = nil
			@path = nil
			make_path(options)
		end
		
		def create(options)
			a = []
			File.open(path) do |f|
			f.lines.each do |line|
				if check_min_max(options, line)
						a << line
				end
			end
			end
			
			
			
			if a.length == 0 || a.length < 4
			  puts "Parameters too strict wordlist is empty"
			  exit(-1)
			else
			  self.list = a
			  shuffle_list()
			end
			
			
			
		end
		
		private
		
		def shuffle_list()
		    self.list = self.list.shuffle
		end
		
		def check_min_max(options, line)
		  if line::chomp::size >= options[:min] && line::chomp::size <= options[:max]
		    true
		  else
		    false
		  end
		end
		
		def make_path(options)
		  fn = options[:wordlist]
		  temp = File.expand_path File.dirname(__FILE__) + "/res/"
		  @path = File.join(temp, fn)
		end
	end

end