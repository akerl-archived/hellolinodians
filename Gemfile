path = File.dirname(ENV['BUNDLE_GEMFILE'] || '.')
ruby File.read(File.join(path, '.circle-ruby')).chomp
source 'https://rubygems.org'

gem 'indefinite_article', '~> 0.2.0'
gem 'linodians', '~> 1.1.1'
gem 'redis', '~> 4.0.0'
gem 'twitter', '~> 6.2.0'

group :development do
  gem 'codecov', '~> 0.1.1'
  gem 'fuubar', '~> 2.3.0'
  gem 'goodcop', '~> 0.4.0'
  gem 'rake', '~> 12.3.0'
  gem 'rspec', '~> 3.7.0'
  gem 'rubocop', '~> 0.55.0'
end
