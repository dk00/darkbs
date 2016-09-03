require! tape
{assert-class, container, row, col, render} = require \./utils

tape 'Grid system' (t) ->
  cases =
    * name: \.container
      $: render container
    * name: \.container-fluid
      $: render container, fluid: true
    * name: \.row
      $: render row
  cases.forEach ({name, $}) ->
    assert-class t, $, name

  t.test 'Column width' (t) ->
    options = xs: 12 sm: 10 md: 8 lg: 6 xl: 4
    $ = render col, options
    for vp, width of options
      assert-class t, $, ".col-#vp-#width"
    t.end!

  t.test 'Column positions' (t) ->
    options =
      xs: pull: 2
      sm: push: 3 size: 6
      md: offset: 4
    $ = render col, options
    <[.pull-xs-2 .push-sm-3 .col-sm-6 .offset-md-4]>forEach ->
      assert-class t, $, it
    t.end!

  t.end!
