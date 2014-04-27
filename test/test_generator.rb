gem 'minitest'
require 'minitest/autorun'
require_relative '../lib/passgen/generator'
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
	@generator = Passgen::Generator.new
    @target  = [["party", "and", "sing", "true"]]
  end

	
  def test_acrostic_generation
    assert_equal @target, @generator::gen_acrostic(@options)
  end
  
  def test_multi_generation
    assert_equal 4, @generator::gen_multi(@options)[0].length
  end
  
  def test_multi_generation_num
	@options[:number] = 10
    assert_equal 10, @generator::gen_multi(@options).length
  end	
  	
end