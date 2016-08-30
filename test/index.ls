sample-paragraph =
  '  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc lobortis,
  velit vel luctus vehicula, turpis tellus hendrerit orci, id suscipit 
  lorem elit eu nibh. Nunc at lorem vel massa dapibus aliquet. Integer sed
  urna sapien. Quisque tincidunt convallis mattis. Aliquam dapibus diam mi.
  Cras sit amet luctus elit. Nunc arcu ligula, bibendum ut pellentesque vel,
  porttitor eget purus. Cras molestie pulvinar sapien, sed cursus diam
  viverra vitae. Cras ultrices odio eros, vitae consequat enim dignissim 
  placerat. Quisque laoreet nunc lorem, sed elementum metus pulvinar ut.
  Donec quis turpis hendrerit, mollis turpis ut, sagittis sem. Sed lorem
  diam, finibus et tincidunt id, dictum et quam. Proin vel porttitor ex.
  Nulla vel nibh vitae erat sollicitudin tristique cursus sit amet libero.
  Maecenas eleifend urna sit amet dignissim elementum.'
  '  Nunc in porta magna. Pellentesque rutrum sodales libero, et efficitu
  tortor bibendum vel. Pellentesque et ligula augue. Etiam sit amet dapibus
  nibh. Nullam lacinia, lorem sed convallis eleifend, quam sem viverra nunc,
  at venenatis neque arcu id lacus. Ut rhoncus mi vel purus vehicula iaculis.
  Maecenas dignissim lobortis sagittis. Donec in sem porta, iaculis magna in,
  gravida quam. In sodales velit in urna eleifend pharetra. Duis vulputate
  turpis nunc, a mattis est tincidunt nec. Morbi sodales massa nec leo luctus
  sagittis. Pellentesque sagittis lectus nisl, eu molestie dui consectetur id.
  Nunc vehicula posuere aliquet. Sed imperdiet interdum lobortis.'
  ...

if typeof describe != \function
  @describe = (, run) -> run!

<- describe 'Rendering in the browser'

if preact?
  {h, render} = preact
else
  h = require \react .createElement
  render = require \react-dom/server .renderToStaticMarkup

{container, row, col} = darkbs ? require \../darkbs

app = ->
  h do
    container
    fluid: true
    h row, {} ...[6 3 2 1]map -> h col, md: it, "col-md-#it"

result = render (h app), document?querySelector \#app-root

specify 'Rendered the sample app with non-empty result' ->
  (require? \assert) result
