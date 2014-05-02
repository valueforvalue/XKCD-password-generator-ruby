gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/passgen/wordlist'



	
class TestWordlist < MiniTest::Test
  def setup
  
	@options = { :wordlist => "test.txt",
            :min => 3,
            :max => 5,
            :count => 4,
			:generate => false,
			:delim => " ",
			:number => 1,
			:filename => "output.txt",
			:print => false,
			:acrostic => "past",
			:valid => ".",
            }
    @wordlist = Passgen::Wordlist.new(@options)
	@wordlist.create(@options)
	@options[:wordlist] = @wordlist.list
  end

  def test_wordlist_path
    assert_equal "c:/Users/A PLUS/passgen/lib/passgen/res/test.txt" , @wordlist.path
  end
  
  def test_wordlist_size
    assert_equal  4 , @options[:wordlist].length
  end			

end