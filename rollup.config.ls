require! {
  path: {relative}
  livescript: {compile}
  'rollup-plugin-node-resolve': node-resolve
}

resolve = node-resolve extensions: <[.ls .js]>
lsc = transform: (code, name) ->
  return unless /\.ls$/test name

  options = bare: true map: \linked filename: relative __dirname, name
  {code, map} = compile code, options
  {code, map: JSON.parse map.toString!}

export
  entry: \lib/index
  plugins: [resolve, lsc]
  sourceMap: true
  moduleName: require \./package.json .name
  exports: \named
  use-strict: false
