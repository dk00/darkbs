require! tape
{class-name} = require \../darkbs

tape 'Class name' (t) ->
  name = \test
  t.equal do
    class-name \test
    name
    'should return the string unchanged'
  t.notOk class-name!, 'should return a falsely value'

  options =
    text: <[nowrap lowercase]>
    hidden:
      down: \sm
      up: \lg
    active: true

  result = class-name options

  <[text-nowrap text-lowercase hidden-sm-down hidden-lg-up active]>
  .forEach ->
    t.ok (0 <= result.search it), "should conain #it"

  t.end!
