module Passgen
	class Wordlist
		attr_reader :list, :path, :temp, :arg
		attr_writer :list
		def initialize(argv)
			@arg = argv
			@list = nil
			@temp = File.expand_path File.dirname(__FILE__)
			@path = File.join(temp, arg)
		end
		
		def create(min, max)
			a = []
			File.open(path) do |f|
			f.lines.each do |line|
				if line::chomp::size >= min && line::chomp::size <= max
						a << line
				end
			end
			end
			self.list = a
		end
		
	end

end