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

if preact?
  {h, render} = preact
else
  h = require \react .createElement
  render = require \react-dom/server .renderToStaticMarkup

{element, container, row, col, button, input} = darkbs ? require \../darkbs
colors = <[primary secondary info success danger warning]>

buttons = ->
  items = colors.map ->
    [h button, color: it, \Knopf ; ' ']
  .reduce (++)
  h col, md: 8, ...items

form = ->
  h do
    row
    {}
    h col, md: 2, h input, placeholder: \Eingabe
    h col, md: 2, h input, placeholder: \Eingabe disabled: true

app = ->
  h do
    container
    fluid: true
    h row, {} h buttons
    h form
    h row, {} ...[6 3 2 1]map -> h col, md: it, "col-md-#it"

result = render (h app), document?querySelector \#app-root

try require! tape
if tape
  that.test 'Render sample app' (t) ->
    t.ok result, 'with non-empty result'
    t.end!
