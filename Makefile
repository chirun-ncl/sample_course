CODE := $(shell grep code config.yml | awk -F ' ' '{print $$2}')

build/index.html: config.yml $(shell find themes -type f) $(shell find . -type f -name \*.tex)
	makecourse -vv 

upload: build/index.html
	ssh webedit@mas-coursebuild.ncl.ac.uk "mkdir -p /srv/www/mas-coursebuild.ncl.ac.uk443/module/$(CODE)"
	scp -r ./build/* webedit@mas-coursebuild.ncl.ac.uk:/srv/www/mas-coursebuild.ncl.ac.uk443/module/$(CODE)

clean:
	rm -rf build *.md *.paux

all: clean upload
