CODE := $(shell grep code config.yml | awk -F ' ' '{print $$2}' | head -n 1)
ifeq ($(strip $(CODE)),)
$(error CODE is empty)
endif

tmp/remote-build: ref.paux config.yml $(shell find themes -type f) $(shell find . -type f -name \*.tex) $(shell find . -type f -name \*.md)
	makecourse -l -vv
	mkdir -p tmp
	if [ -f tmp/local-build ]; then rm tmp/local-build; fi
	touch tmp/remote-build

tmp/local-build: ref.paux config.yml $(shell find themes -type f) $(shell find . -type f -name \*.tex) $(shell find . -type f -name \*.md)
	makecourse -l -vv -w "$(shell pwd)/build/"
	if [ -f tmp/remote-build ]; then rm tmp/remote-build; fi
	mkdir -p tmp
	touch tmp/local-build

local: tmp/local-build
	xdg-open file://$(shell pwd)/build/index.html

upload: tmp/remote-build cleanremote
	ssh webedit@mas-coursebuild.ncl.ac.uk "mkdir -p /srv/www/mas-coursebuild.ncl.ac.uk443/module/$(CODE)"
	scp -r ./build/* webedit@mas-coursebuild.ncl.ac.uk:/srv/www/mas-coursebuild.ncl.ac.uk443/module/$(CODE)

clean:
	rm -rf build *.paux tmp

cleanremote:
	ssh webedit@mas-coursebuild.ncl.ac.uk "rm -rf /srv/www/mas-coursebuild.ncl.ac.uk443/module/$(CODE)"

ref.paux : $(shell find . -type f -name \*.tex)
	makecourse -l -vv
	touch ref.paux

all: clean upload
