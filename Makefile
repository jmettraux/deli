
serve:
	bundle exec rackup -p 7080 -s thin
s: serve

.PHONY: serve

