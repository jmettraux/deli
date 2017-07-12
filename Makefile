
serve:
	bundle exec rackup -p 7080 -s thin lib/deli.ru
s: serve

.PHONY: serve

