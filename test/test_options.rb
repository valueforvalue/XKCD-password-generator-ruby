require 'test/unit'
require 'shoulda'
require_relative '../lib/passgen/options'


class TestOptions < Test::Unit::TestCase
	
	context "Specify no wordlist." do
		should "return default" do
			opts = Passgen::Options.new(["someword"])
			assert_equal Passgen::Options::DEFAULT_WORDLIST, opts.wordlist
		end
	end
	context "specify a wordlist" do
		should "return it" do 
			opts = Passgen::Options.new(["-w", "mywordlist", "someword"])
			assert_equal "mywordlist", opts.wordlist
		end
	end
	
		context "specify acrostic and no wordlist" do
		should "return the words" do 
			opts = Passgen::Options.new(["word1", "word2"])
			assert_equal ["word1","word2"] , opts.acrostic
		end
	end
	
		context "specify acrostic and wordlist" do
		should "return the words" do 
			opts = Passgen::Options.new(["-w", "mywordlist", "word1", "word2"])
			assert_equal ["word1","word2"] , opts.acrostic
		end
	end
end