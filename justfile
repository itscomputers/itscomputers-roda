serve:
  bundle exec rerun rackup

test:
  bundle exec rspec

console:
  bundle exec irb -I app

lint:
  bundle exec standardrb

lint_fix:
  bundle exec standardrb --fix

