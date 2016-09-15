require! tape
{render, input} = require \./utils

tape 'Forms' (t) ->
  $ = render input
  t.ok ($.has \input), "should have default tag name 'input'"
  t.ok ($.has '[type="text"]'), "should have default type 'text'"
  name = \.form-control
  t.ok ($.has name), "should have class #name"

  name-file = \.form-control-file
  $file = render input, type: \file
  t.ok ($file.has name-file), "should have class #name-file"

  t.end!
