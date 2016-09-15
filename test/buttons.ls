require! tape
{render, button} = require \./utils

tape \Buttons (t) ->
  def = <[.btn .btn-secondary]>
  $ = render button
  t.ok ($.has \button), "should have default tag-name 'button'"
  t.ok ($.has '[type="button"]'),  "should have default type 'button'"
  t.ok (def.every $.has), "should have default classes #{def.join ' '}"

  t.end!
