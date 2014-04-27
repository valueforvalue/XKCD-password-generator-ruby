gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/passgen/options'


class TestOptions < MiniTest::Test
  def setup
	@options = [ "-w","test_wordlist.txt",
            "-m", "4",
            "-x", "8",
            "-c", "5",
			"-g","-d", 
			"-", "-n", 
			"12", "-p", 
			"test_output.txt",
			"-a", "anacrostic",
            ]
			
	@opts = Passgen::Options.new(@options)
  end
  
  def test_options_wordlist_default
	assert_equal "test_wordlist.txt", @opts.options[:wordlist]
  end
	
  def test_options_wordlist
	assert_equal "test_wordlist.txt", @opts.options[:wordlist]
  end
  
  def test_options_acrostic
	assert_equal "anacrostic" , @opts.options[:acrostic]
  end

  def test_options_wordlist_acrostic
	assert_equal "anacrostic" , @opts.options[:acrostic]
	assert_equal "test_wordlist.txt" , @opts.options[:wordlist]
  end
  
  def test_options_options
	assert_equal 4 , @opts.options[:min]
	assert_equal 8 , @opts.options[:max]
	assert_equal 5 , @opts.options[:count]
	assert_equal true , @opts.options[:generate]
	assert_equal "-" , @opts.options[:delim]
	assert_equal 12 , @opts.options[:number]
	assert_equal "test_output.txt" , @opts.options[:filename]
	assert_equal true , @opts.options[:print]
	assert_equal "anacrostic" , @opts.options[:acrostic]
  end
end