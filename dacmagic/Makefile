.PHONY: contacts

sx20: clean
	# individual STLs, PNGs and reports
	find parts/ views/ jigs/  -name '*.scad' | parallel --no-notice ./render

	# contact sheets
	./makeContactSheet dist/views/*png dist/views.png
	./makeContactSheet dist/parts/*png dist/parts.png
	./makeContactSheet dist/jigs/*png dist/jigs.png

	./makeContactSheet dist/views.png dist/parts.png dist/jigs.png dist/all.png

clean:
	rm -rf dist/*
	rm -rf tmp/
	rm -rf etc/resources/admesh-0.98.4/

macos_link:
	ln -s /Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD ~/.local/bin/openscad

admesh:
	# note: LD_LIBRARY_PATH=/usr/local/lib/
	cd etc/resources/; tar -xf admesh-0.98.4.tar.gz
	cd etc/resources/admesh-0.98.4 && ./configure
	cd etc/resources/admesh-0.98.4 && make
	cd etc/resources/admesh-0.98.4 && sudo make install

deps: admesh
	sudo apt-get install openscad imagemagick optipng parallel
