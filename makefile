mo:
	mkdir -p ./debian/build/locale/cs/LC_MESSAGES
	msgfmt -c po/cs.po -o ./debian/build/locale/cs/LC_MESSAGES/ppa-download-counter.mo

clean:
	rm -rf ./debian/build
