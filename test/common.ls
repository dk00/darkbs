require! tape
{render, class-name, element} = require \./utils

tape 'Class name' (t) ->
  name = \custom-class
  t.equal do
    class-name name
    name
    'should return the string unchanged'
  t.notOk class-name!

  options =
    text: <[nowrap lowercase]>
    hidden:
      up: \lg
    active: true
    unknown: true

  result = class-name [options, hidden: \sm]
  $ = render element, className: [name, [options] hidden: \sm active: false]

  t.ok ($ ".#name" .length), "should have #name in the element"
  t.notOk (render element, acitve: false .has \active),\
    "handling active: disabled"

  <[text-nowrap text-lowercase hidden-sm-down hidden-lg-up active]>
  .forEach ->
    t.ok (0 <= result.search it), "should conain #it"
    t.ok ($ ".#it" .length), "should have #it in the element"

  colors = <[primary info success danger warning reverse]>
  bg = colors.every ->
    render element, className: background: it .has ".bg-#it"
  t.ok bg, 'contextual backgrounds'

  t.end!
