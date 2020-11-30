PREFIX = /usr/local

esv: esv.sh esv.awk esv.tsv
	cat esv.sh > $@
	echo 'exit 0' >> $@
	echo '#EOF' >> $@
	tar cz esv.awk esv.tsv >> $@
	chmod +x $@

test: esv.sh
	shellcheck -s sh esv.sh

clean:
	rm -f esv

install: esv
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f esv $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/esv

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/esv

.PHONY: test clean install uninstall
