module Passgen
    # Prints the generated password(s) to the *STDOUT* and/or a file.
  class Printer
    # Holds the current generated password(s) to be printed to *STDOUT*
    attr_reader :pass
    # Sets up password for printing.
    def initialize(options)
      @temp = options[:password]
      @pass = []
      @delim = options[:delim]
      print_array(options)
    end
    
    
    # Adds delimiter between words in password(s),
    # optionally prints results to a file.
    def print_array(options)
      @temp.each do |x|
        word = x.join(@delim)
        @pass << word
      end
      puts "\n"
      puts "Password(s):"
      @pass.each do |p|
        puts "#{p} \n"
      end
      
      if options[:print]
        print_to_file(options)
      end
      
    end
    
    private
    def print_to_file(options)
        File.open(options[:filename], "w") do |f|
        f.puts(@pass)
      end
      

    end
    
  end

end