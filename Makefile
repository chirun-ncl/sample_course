CODE := $(shell grep code config.yml | awk -F ' ' '{print $$2}' | head -n 1)
ifeq ($(strip $(CODE)),)
$(error CODE is empty)
endif

build/index.html: ref.paux config.yml $(shell find themes -type f) $(shell find . -type f -name \*.tex) $(shell find . -type f -name \*.md)
	makecourse -vv 

upload: cleanremote build/index.html 
	ssh webedit@mas-coursebuild.ncl.ac.uk "mkdir -p /srv/www/mas-coursebuild.ncl.ac.uk443/module/$(CODE)"
	scp -r ./build/* webedit@mas-coursebuild.ncl.ac.uk:/srv/www/mas-coursebuild.ncl.ac.uk443/module/$(CODE)

clean:
	rm -rf build *.md *.paux tmp

cleanremote:
	ssh webedit@mas-coursebuild.ncl.ac.uk "rm -rf /srv/www/mas-coursebuild.ncl.ac.uk443/module/$(CODE)"

ref.paux : $(shell find . -type f -name \*.tex)
	makecourse -l -vv
	touch ref.paux

all: clean upload
