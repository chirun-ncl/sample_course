DEFAULTTHEME := $(shell grep -A 5 themes config.yml | grep 'path:' | head -1 | tr -d ' ' | awk -F  ':' '{print $$2;}')
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	OPENCMD := open 
else
	OPENCMD := xdg-open
endif

build: config.yml $(shell find . -type f -name \*.tex) $(shell find . -type f -name \*.md)
	chirun -z -vv

local: build
	$(OPENCMD) file://$(shell pwd)/build/$(DEFAULTTHEME)/index.html

clean:
	rm -rf build tmp
	find . \( -name 'oembed-cache.json' -o -name '*.log' -o -name '*.aux' -o -name '*.out' \
		-o -name '*.nav' -o -name '*.snm' -o -name '*.toc' -o -name '*.dst' -o -name '*.fls' \
		-o -name '*.bbl' -o -name '*.blg' \) -exec rm {} \;
