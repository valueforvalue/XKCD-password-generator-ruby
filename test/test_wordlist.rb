require 'test/unit'
require 'shoulda'
require_relative '../lib/passgen/wordlist'


class TestWordlist < Test::Unit::TestCase
	
	context "Specify wordlist" do
		should "return wordlist" do
			wlist = Passgen::Wordlist.new("res/test.txt")
			assert_equal "res/test.txt" , wlist.arg
		end
	end
	
	
	context "Specify wordlist" do
		should "return wordlist with full path" do
			wlist = Passgen::Wordlist.new("res/test.txt")
			assert_equal "C:/Users/A PLUS/passgen/lib/passgen/res/test.txt" , wlist.path
		end
	end
	
	context "Test wordlist creation" do
		should "return wordlist array with 5 words." do
			wlist = Passgen::Wordlist.new("res/test.txt")::create()
			assert_equal  4 , wlist.length
		end
	end
	
end