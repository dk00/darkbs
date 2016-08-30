h = (try require \react .createElement) ||
  (try require \preact .h) ||
  React?createElement || preact?h

setCreateElement = (h := )

join = (-> []concat it .filter (-> it) .join ' ')

viewports = <[xs sm md lg xl]>

hidden-class = (options || {}) ->
  options = down: options if typeof options == \string
  join <[down up]>map ->
    "hidden-#that-#it" if options[it]

class-name = (options || {}) ->
  join items =
    join (options.text || [])map -> "text-#it"
    \active if options.active
    hidden-class options.hidden

detach = (props || {}, keys || []) ->
  {[k, props[k]] for k of props when !keys.some (== k)}

element = (keys || {}, class-name) ->
  ({tag-name || \div}: props) ->
    h tag-name, (detach props, [\tagName \className] ++ keys)
    <<< class-name: join [join class-name props; props.class-name]

``
export {join, viewports, element, className, setCreateElement}
export default className``
