require! {
  fs: unlinkSync: unlink
  child_process: {exec}
  gulp
  \gulp-sourcemaps : source-maps
  \rollup-stream
  \gulp-sass : sass
  \vinyl-source-stream : source
  \vinyl-buffer : buffer
  \gulp-rename : rename
  \gulp-uglify : uglify
  \gulp-slm : slm
  \gulp-server-livereload : server
}

gulp.task \clean ->
  require \./package.json .files.forEach -> try unlink it

output-dir = \.
map-options =
  includeContent: false
  sourceRoot: \https://raw.githubusercontent.com/dk00/darkbs/master

gulp.task \sass ->
  Promise.all <[expanded compressed]>map (style) -> new Promise (resolve) ->
    gulp.src \sass/*sass
    .pipe source-maps.init!
    .pipe sass outputStyle: style
    |> ->
      if style == \compressed then
        it.pipe rename suffix: \.min
      else
        it
    |> ->
      it.pipe source-maps.write \. map-options
      .pipe gulp.dest output-dir
      .on \end resolve

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

gulp.task \test <[dist]> (done) ->
  exec 'lsc test/all | faucet'  stdio: \inherit
    ..stdout.pipe process.stdout
    ..stderr.pipe process.stderr
    ..on \exit ->
      throw if it
      done!

gulp.task \server <[watch]> ->
  gulp.src [\test/*.html "#output-dir/*.js" "#output-dir/*.css"]
  .pipe server {host: \0.0.0.0, +livereload}

gulp.task \default <[sass slm server]>
