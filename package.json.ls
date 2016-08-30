name: \darkbs
version: \0.0.1
description: 'Functional Bootstrap components & dark color scheme'

keywords: <[component bootstrap react]>
author: 'dk00 <dk00@users.noreply.github.com>'
homepage: \https://github.com/dk00/darkbs
bugs: \https://github.com/dk00/darkbs/issues
license: \Unlicense

engines:
  node: '>= 4.2.0'

files:
  \darkbs.css
  \darkbs.css.map
  \darkbs.min.css
  \darkbs.min.css.map
  \darkbs.es.js
  \darkbs.es.js.map
  \darkbs.js
  \darkbs.js.map
  \darkbs.min.js
  \darkbs.min.js.map

main: \darkbs.js
\jsnext:main : \darkbs.es.js

scripts:
  start: \gulp
  prepublish: 'gulp dist'
  test: 'gulp test'

repository: \dk00/darkbs

dev-dependencies:
  livescript: ''
  gulp: ''
  \gulp-sourcemaps : ''
  \rollup-stream : ''
  \rollup-plugin-node-resolve : ''
  \gulp-sass : ''
  \vinyl-source-stream : ''
  \vinyl-buffer : ''
  \gulp-rename : ''
  \gulp-uglify : ''
  \gulp-slm : ''
  \gulp-server-livereload : ''
  mocha: ''
  cheerio: ''
  react: ''
  \react-dom : ''
