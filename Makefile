CODE := $(shell grep code config.yml | awk -F ' ' '{print $$2}' | head -n 1)
YEAR := $(shell grep year config.yml | awk -F ' ' '{print $$2}' | head -n 1)
DEFAULTTHEME := $(shell grep -A 5 themes config.yml | grep 'path:' | head -1 | tr -d ' ' | awk -F  ':' '{print $$2;}')
-UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	OPENCMD := open 
else
	OPENCMD := xdg-open
endif
ifeq ($(strip $(CODE)),)
$(error CODE is empty)
endif
ifeq ($(strip $(YEAR)),)
$(error YEAR is empty)
endif

tmp/local-build: config.yml $(shell find themes -type f) $(shell find . -type f -name \*.tex) $(shell find . -type f -name \*.md)
	makecourse -l -z -vv 
	if [ -f tmp/remote-build ]; then rm tmp/remote-build; fi
	mkdir -p tmp
	touch tmp/local-build

tmp/remote-build: config.yml $(shell find themes -type f) $(shell find . -type f -name \*.tex) $(shell find . -type f -name \*.md)
	makecourse -z -vv
	makecourse -vv
	mkdir -p tmp
	if [ -f tmp/local-build ]; then rm tmp/local-build; fi
	touch tmp/remote-build

local: tmp/local-build
	$(OPENCMD) file://$(shell pwd)/build/$(DEFAULTTHEME)/index.html

upload: tmp/remote-build cleanremote
	ssh webedit@mas-coursebuild.ncl.ac.uk "mkdir -p /srv/www/mas-coursebuild.ncl.ac.uk443/module/$(CODE)/$(YEAR)"
	scp -r config.yml ./build/* webedit@mas-coursebuild.ncl.ac.uk:/srv/www/mas-coursebuild.ncl.ac.uk443/module/$(CODE)/$(YEAR)

clean:
	rm -rf build tmp
	find . \( -name '*.log' -o -name '*.aux' -o -name '*.out' \) -exec rm {} \;

cleanremote:
	ssh webedit@mas-coursebuild.ncl.ac.uk "rm -rf /srv/www/mas-coursebuild.ncl.ac.uk443/module/$(CODE)/$(YEAR)"

all: clean upload
