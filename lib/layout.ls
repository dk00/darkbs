``import {wrap, join, viewports} from './common'``

container = wrap \fluid ->
  \container + if it.fluid then \-fluid else ''

row = wrap [] -> \row

col = wrap viewports, (props) ->
  get-width = -> +it || it?width || it?size
  min-vp = viewports.find (props.) or viewports.0
  auto-width = unless get-width props[min-vp] then "col-#min-vp"

  (-> [auto-width, it]) viewports.map (vp) ->
    width = "col-#vp-#that" if get-width props[vp]
    positions = <[offset push pull]>map ->
      "#it-#vp-#that" if props[vp]?[it]

    [width, positions]

``export {container, row, col}``
