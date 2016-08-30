``import {element, join, viewports} from './common'``

container = element \fluid ->
  \container + if it.fluid then \-fluid else ''

row = element [] -> \row

col = element viewports, (props) ->
  get-size = -> it?size || +it
  sizes = (|| \col-sm-4) <| join viewports.map (viewport) ->
    "col-#viewport-#that" if get-size props[viewport]
  positions = viewports.map (vp) ->
    join <[offset push pull]>map ->
      "#it-#vp-#that" if props[vp]?[it]

  [sizes] ++ positions

``export {container, row, col}``
