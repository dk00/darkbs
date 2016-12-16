require! {
  fs: unlinkSync: unlink
  gulp
  \gulp-sourcemaps : source-maps
  \rollup-stream
  \gulp-sass : sass
  \vinyl-source-stream : source
  \vinyl-buffer : buffer
  \gulp-rename : rename
  \gulp-uglify : uglify
  \gulp-slm : slm
  \browser-sync
  \gulp-tape : tape
  \tap-colorize
}

gulp.task \clean ->
  require \./package.json .files.forEach -> try unlink it

output-dir = \.
map-options =
  includeContent: false
  sourceRoot: \https://raw.githubusercontent.com/dk00/darkbs/master

retry-sass = 0
gulp.task \sass ->
  Promise.all <[expanded compressed]>map (style, i) -> new Promise (resolve) ->
    build = sass outputStyle: style
    build.on \error ->
      console.log it
      @emit \end
      if i == 0 && retry-sass-- > 0
        setTimeout (-> gulp.start \sass), 77

    gulp.src \sass/*sass
    .pipe source-maps.init!
    .pipe build
    |> ->
      if style == \compressed then
        it.pipe rename suffix: \.min
      else
        it
    |> ->
      it.pipe source-maps.write \. map-options
      .pipe gulp.dest output-dir
      .on \end resolve
  .then -> (retry-sass := 7)

bundle-name = \darkbs.js

gulp.task \bundle ->
  config = require \./rollup.config
  targets =
    * rename: \.es
    * format: \umd
    * rename: \.min format: \umd pipe: uglify

  Promise.all targets.map (target) -> new Promise (resolve) ->
    rollup-stream target{format} <<< config
    .pipe source bundle-name
    .pipe buffer!
    .pipe source-maps.init loadMaps: true
    |> ->
      if target.pipe then it.pipe that! else it
    |> ->
      if target.rename then it.pipe rename suffix: that else it
    |> ->
      it.pipe source-maps.write \. map-options
      .pipe gulp.dest output-dir
      .on \end resolve

gulp.task \dist <[sass bundle]>

gulp.task \slm ->
  gulp.src \test/*slm
  .pipe slm!
  .pipe gulp.dest \test

gulp.task \watch ->
  gulp.watch <[sass/*]> <[sass]>
  gulp.watch \test/*slm <[slm]>

gulp.task \coverage ->
  {instrument, hook-require, write-reports} = require \./gulp/instrument
  ins = gulp.src \lib/*
  .pipe instrument!
  .pipe hook-require!

  <- ins.on \end
  gulp.src \./test/all.ls
  .pipe tape reporter: tap-colorize!
  .pipe write-reports!

gulp.task \server <[watch]> ->
  server = browser-sync.create!
  server.init do
    server: [\test output-dir]
    files: [\test] ++ require \./package.json .files

gulp.task \default <[sass slm server]>
