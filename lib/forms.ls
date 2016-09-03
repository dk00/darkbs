``import {wrap} from './common'``

input = wrap <[]> ({type}) ->
  \form-control + if type == \file then \-file else ''

input.defaultProps =
  tag-name: \input
  type: \text

``export {input}``
