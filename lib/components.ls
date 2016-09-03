``import {wrap} from './common'``

button = wrap <[color size outline block]> \
({color || \secondary, size, outline, block}) ->
  [\btn "btn-#color"]

button.defaultProps = tag-name: \button type: \button

``export {button}``
