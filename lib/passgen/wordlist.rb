module Passgen
	class Wordlist
		attr_reader :list, :path, :temp, :arg
		attr_writer :list
		def initialize(argv)
			@arg = argv
			@list = nil
			@temp = File.expand_path File.dirname(__FILE__)
			@path = File.join(self.temp, self.arg)
		end
		
		def create()
			a = []
			File.open(self.path) do |f|
			f.lines.each do |line|
				a << line.strip
				end
			end
			self.list = a
		end
		
	end

end