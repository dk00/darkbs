require! tape
{assert-class, render, button} = require \./utils

tape \Buttons (t) ->

  $ = render \button
  <[btn btn-secondary]>forEach ->
    assert-class t, $, it

  t.ok ($ '[type="button"]'), "should have default type 'button'"

  t.end!
