path = File.dirname(ENV['BUNDLE_GEMFILE'] || '.')
ruby File.read(File.join(path, '.circle-ruby')).chomp
source 'https://rubygems.org'

gem 'linodians', '~> 1.1.0'
gem 'indefinite_article', '~> 0.2.0'
gem 'twitter', '~> 6.1.0'
gem 'redis', '~> 4.0.0'

group :development do
  gem 'rubocop', '~> 0.50.0'
  gem 'rake', '~> 12.1.0'
  gem 'codecov', '~> 0.1.1'
  gem 'rspec', '~> 3.6.0'
  gem 'fuubar', '~> 2.2.0'
end
