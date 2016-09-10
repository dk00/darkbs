require! {
  fs: {readFileSync: readFile}
  \babel-core : {transform}
  livescript: compile: lsc
}

module.exports = compile = (code, {filename}) ->
  {code: code-es6, map} = if /\.ls$/test filename
    lsc code, {bare: true map: \embedded filename}
  else
    {code}

  babel-opts =
    sourceMaps: \both
    inputSourceMap: if map then JSON.parse map.toString!
    plugins: [\transform-es2015-modules-commonjs]

  transform code-es6, babel-opts
