gem 'minitest'
require 'minitest/autorun'
require_relative '../lib/passgen/wordlist'



	
class TestGenerator < MiniTest::Test
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
            }
    @wordlist = Passgen::Wordlist.new(@options)
	@wordlist.create(@options)
	@options[:wordlist] = @wordlist.list
  end

  def test_wordlist_path
    assert_equal "C:/Users/A PLUS/passgen/lib/passgen/res/test.txt" , @wordlist.path
  end
  
  def test_wordlist_size
    assert_equal  4 , @options[:wordlist].length
  end			

end