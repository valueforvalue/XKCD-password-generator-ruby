require 'test/unit'
require 'shoulda'
require_relative '../lib/passgen/generator'
require_relative '../lib/passgen/wordlist'


class TestGenerator < Test::Unit::TestCase
	
	context "Specify test wordlist & acrostic" do
		should "return expected acrostic password" do
			target = ["party", "and", "sing", "true"]
			wlist = Passgen::Wordlist.new("res/test.txt")::create()
			gen = Passgen::Generator.new()::gen_acrostic(wlist, "past")
			assert_equal target , gen
		end
	end
	
end