
serve:
	bundle exec rackup -p 4080 -s thin lib/deli.ru
s: serve

.PHONY: serve

