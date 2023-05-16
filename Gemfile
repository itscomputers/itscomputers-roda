source "https://rubygems.org"

ruby "3.2.2"

gem "kramdown"
gem "puma"
gem "rackup", "~> 2.1"
gem "roda"
gem "sassc"
gem "slim"

group :development, :test do
  gem "standard", "~> 1.28", require: false
  gem "rubocop-rspec", require: false
end

group :development do
  gem "rerun"
  gem "irb"
end

group :test do
  gem "rspec"
  gem "capybara"
end
