h = void
setup = (h := )

setup preact?h || React?createElement ||
  (try require \preact .h) || (try require \react .createElement)

function join => []concat it .filter (-> it) .join ' '

viewports = <[xs sm md lg xl]>

function hidden-class(options || {})
  options = down: options if typeof options == \string
  join <[down up]>map ->
    "hidden-#that-#it" if options[it]

function class-name(options || {})
  return options if typeof options != \object
  join items =
    join (options.text || [])map -> "text-#it"
    \active if options.active
    hidden-class options.hidden

function drop(keys || [], props || {})
  {[k, props[k]] for k of props when !keys.some (== k)}

function wrap(keys || {}, class-name)
  ({tag-name || \div}: props) ->
    h tag-name, (drop [\tagName \className] ++ keys, props)
    <<< class-name: join [join class-name props; props.class-name]

``
export {join, wrap, viewports, className}
export default setup``
