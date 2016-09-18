h = void
setup = (h := )

function join => []concat it .filter (-> it) .join ' '

viewports = <[xs sm md lg xl]>

function enable(name)
  -> name if it

function prefix(name)
  -> join <| []concat it .map -> "#name-#it"

utilties =
  text: prefix \text
  bg: prefix \bg
  active: enable \active
  hidden: (options) ->
    if typeof options == \string and options
      return "hidden-#{that}-down"
    join <[down up]>map ->
      "hidden-#that-#it" if options[it]

utilties.background = utilties.bg

function class-name(options={})
  return options if typeof options != \object
  return join that if options.map? class-name

  join <| for name, value of options
    utilties[name]? value

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
