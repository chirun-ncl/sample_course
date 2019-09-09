CODE := $(shell grep code config.yml | awk -F ' ' '{print $$2}' | head -n 1)
YEAR := $(shell grep year config.yml | awk -F ' ' '{print $$2}' | head -n 1)
BASE_DIR := $(shell grep base_dir config.yml | awk -F ' ' '{print $$2}' | head -n 1)
DEFAULTTHEME := $(shell grep -A 5 themes config.yml | grep 'path:' | head -1 | tr -d ' ' | awk -F  ':' '{print $$2;}')
UNAME_S := $(shell uname -s)
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
ifeq ($(strip $(BASE_DIR)),)
BASE_DIR := module
endif

local-build: config.yml $(shell find . -type f -name \*.tex) $(shell find . -type f -name \*.md)
	makecourse -l -z -vv 

remote: config.yml $(shell find . -type f -name \*.tex) $(shell find . -type f -name \*.md)
	makecourse -z -vv

local: local-build
	$(OPENCMD) file://$(shell pwd)/build/$(DEFAULTTHEME)/index.html

upload: remote cleanremote
	ssh webedit@mas-coursebuild.ncl.ac.uk "mkdir -p /srv/www/mas-coursebuild.ncl.ac.uk443/$(BASE_DIR)/$(CODE)/$(YEAR)"
	scp -r config.yml ./build/* webedit@mas-coursebuild.ncl.ac.uk:/srv/www/mas-coursebuild.ncl.ac.uk443/$(BASE_DIR)/$(CODE)/$(YEAR)
	ssh webedit@mas-coursebuild.ncl.ac.uk "echo '<?php header(\"Location: /$(BASE_DIR)/$(CODE)/$(YEAR)/$(DEFAULTTHEME)/\");die();?>' > /srv/www/mas-coursebuild.ncl.ac.uk443/$(BASE_DIR)/$(CODE)/$(YEAR)/index.php"

clean:
	rm -rf build tmp
	find . \( -name 'oembed-cache.json' -o -name '*.log' -o -name '*.aux' -o -name '*.out' -o -name '*.nav' -o -name '*.snm' -o -name '*.toc' \) -exec rm {} \;

cleanremote:
	ssh webedit@mas-coursebuild.ncl.ac.uk "rm -rf /srv/www/mas-coursebuild.ncl.ac.uk443/$(BASE_DIR)/$(CODE)/$(YEAR)"

all: clean upload
