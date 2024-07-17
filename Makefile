.PHONY: setup test

setup:
	bundle exec rake db:create db:migrate db:seed

test:
	bundle exec rspec
