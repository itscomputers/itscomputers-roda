source "https://rubygems.org"

ruby "3.2.2"

gem "roda"
gem "puma"
gem "slim"
gem "kramdown"
gem "sassc"

group :development, :test do
  gem "standard", "~> 1.28", require: false
  gem "rubocop-rspec", require: false
end

group :development do
  gem "rackup", "~> 2.1"
  gem "rerun"
  gem "irb"
end

group :test do
  gem "rspec"
  gem "capybara"
end
