path = File.dirname(ENV['BUNDLE_GEMFILE'] || '.')
ruby File.read(File.join(path, '.circle-ruby')).chomp
source 'https://rubygems.org'

gem 'indefinite_article', '~> 0.2.0'
gem 'linodians', '~> 1.1.1'
gem 'redis', '~> 4.1.0'
gem 'twitter', '~> 6.2.0'

group :development do
  gem 'codecov', '~> 0.1.1'
  gem 'goodcop', '~> 0.8.0'
end
