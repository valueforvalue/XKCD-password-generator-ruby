Gem::Specification.new do |s|
  s.name        = 'passgen'
  s.version     = '0.0.1'
   s.executables << 'passgen'
  s.date        = '2014-04-22'
  s.summary     = "A gem to generate passwords."
  s.description = "Passwords are generated in a rather unique way."
  s.authors     = ["Jeremy Morris"]
  s.email       = 'valueforvalue76@gmail.com'
  s.files       = ["lib/passgen.rb", "lib/passgen/options.rb",
  "lib/passgen/wordlist.rb", "lib/passgen/printer.rb", "lib/passgen/generator.rb",
  "lib/passgen/res/2of12.txt", "lib/passgen/res/3esl.txt", "lib/passgen/res/test.txt",
  "lib/passgen/res/wordsEn.txt",]
  s.test_files = Dir.glob('test/test_*.rb')
  s.homepage    = 'http:\\localhost.com'
  s.license     = 'BSD'
end