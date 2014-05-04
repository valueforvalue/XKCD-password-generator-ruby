gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/passgen/options'


class TestOptions < MiniTest::Test
  def setup(extra="")
	@options = [ "-w","test_wordlist.txt",
            "-m", "4",
            "-x", "8",
            "-c", "5",
			"-d", "-",
			"-n", "12",
			"-p", 
			"test_output.txt",
			"-a", "anacrostic",
			"-v", "[a-z]", "-l",
            ]
	@options << extra
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
	assert_equal "-" , @opts.options[:delim]
	assert_equal 12 , @opts.options[:number]
	assert_equal "test_output.txt" , @opts.options[:filename]
	assert_equal true , @opts.options[:print]
	assert_equal "anacrostic" , @opts.options[:acrostic]
	assert_equal "[a-z]" , @opts.options[:valid]
	assert_equal true , @opts.options[:list]
  end
  
  def test_generate_option
    # This must be tested in isolation because the *-g* and *-a* options
	# cannot be set at the same time.
    setup("-g")
	assert_equal true , @opts.options[:generate]
  end
end