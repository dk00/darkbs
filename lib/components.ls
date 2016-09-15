``import {wrap} from './common'``

button = wrap <[color size outline block]> \
({color || \secondary, size, outline, block}) ->
  [\btn "btn-#color"]

button.defaultProps = tag-name: \button type: \button

tag = wrap <[color pill]> ({color, pill}) ->
  [\tag "tag-#color" if pill then \tag-pill else '']

tag.defaultProps = tag-name: \span, color: \default

``export {button, tag}``
