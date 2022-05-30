serve:
  bundle exec rerun rackup

test:
  bundle exec rspec

console:
  bundle exec irb -I app

lint:
  bundle exec rubocop

lint_fix:
  bundle exec rubocop -A

