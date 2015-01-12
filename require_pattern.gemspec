$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

Gem::Specification.new 'require_pattern', '1.1' do |s|
  s.summary           = 'Requires files based on a pattern in a robust and optimistic manner.'
  s.authors           = ['Tom Wardrop']
  s.email             = 'tom@tomwardrop.com'
  s.homepage          = 'http://github.com/wardrop/RequirePattern'
  s.license           = 'MIT'
  s.files             = Dir.glob(`git ls-files`.split("\n") - %w[.gitignore])
  s.test_files        = Dir.glob('spec/spec.rb')
  s.rdoc_options      = %w[--line-numbers --inline-source --title Scorched --encoding=UTF-8]

  s.required_ruby_version = '>= 1.9.3'
  s.add_development_dependency 'maxitest'
  s.add_development_dependency 'mocha'
end
