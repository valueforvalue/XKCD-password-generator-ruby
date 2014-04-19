require 'test/unit'
require 'shoulda'
require_relative '../lib/passgen/options'


class TestOptions < Test::Unit::TestCase
	
	context "Specify no wordlist." do
		should "return default" do
			opts = Passgen::Options.new(["someword"])
			assert_equal Passgen::Options::DEFAULT_WORDLIST, opts.options[:wordlist]
		end
	end
	context "specify a wordlist" do
		should "return it" do 
			opts = Passgen::Options.new(["-w", "mywordlist", "someword"])
			assert_equal "mywordlist", opts.options[:wordlist]
		end
	end
	
		context "specify acrostic and no wordlist" do
		should "return the word" do 
			opts = Passgen::Options.new(["-a", "word2"])
			assert_equal "word2" , opts.options[:acrostic]
		end
	end
	
		context "specify acrostic and wordlist" do
		should "return the word" do 
			opts = Passgen::Options.new(["-w", "mywordlist", "-a", "word2"])
			assert_equal "word2" , opts.options[:acrostic]
		end
	end
end