![Build](https://github.com/coursebuilder-ncl/sample_course/workflows/Build/badge.svg)

## Coursebuilder Sample Course

This repository contains a set of sample CourseBuilder compatible notes, using both Markdown
and LaTeX formatted documents. Notes, embeddable content and presentation slides are demonstrated.

#### Build
Build the notes locally by installing the
[CourseBuilder `makecourse` package](https://github.com/coursebuilder-ncl/makecourse) and
then running `make local` in this repository.

Notes ready to be uploaded online can be built by changing the web path in `config.yml` and
then running `make remote`.

#### Preview
The CourseBuilder output after running the `makecourse` script on this repository can be
previewed at https://coursebuilder-ncl.github.io/sample_course/.
