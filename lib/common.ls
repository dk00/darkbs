h = void
setup = (h := )

function join => []concat it .filter (-> it) .join ' '

viewports = <[xs sm md lg xl]>

function hidden-class(options || {})
  options = down: options if typeof options == \string
  join <[down up]>map ->
    "hidden-#that-#it" if options[it]

function class-name(options || {})
  return options if typeof options != \object
  return join that if options.map? class-name

  join [
    join (options.text || [])map -> "text-#it"
    \active if options.active
    hidden-class options.hidden
  ]

function drop(keys, props)
  {[k, props[k]] for k of props when !keys.some (== k)}

function wrap(keys, get-class)
  (props) ->
    element Object.assign do
      drop [] ++ keys, props
      class-name: [get-class props; props.class-name]

function element({tag-name || \div}: props)
  h tag-name, Object.assign do
    drop [\tagName] props
    class-name: class-name props.class-name

``
export {setup, join, wrap, viewports, element, className}``
