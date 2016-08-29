``import {element, join, viewports} from './common'``

container = element \fluid ->
  \container + if it.fluid then \-fluid else ''

row = element [] -> \row

col = element viewports, (props) ->
  sizes = (|| \col-sm-4) <| join viewports.map (viewport) ->
    "col-#viewport-#{that.size || that}" if props[viewport]
  [sizes]

``export {container, row, col}``
