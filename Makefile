build:
	chirun -z -vv

clean:
	rm -rf build tmp
	find . \( -name 'oembed-cache.json' -o -name '*.log' -o -name '*.aux' -o -name '*.out' \
		-o -name '*.nav' -o -name '*.snm' -o -name '*.toc' -o -name '*.dst' -o -name '*.fls' \
		-o -name '*.bbl' -o -name '*.blg' \) -exec rm {} \;
