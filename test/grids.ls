require! tape
{container, row, col, render} = require \./utils

tape 'Grid system' (t) ->
  cases =
    * name: \.container
      $: render container
    * name: \.container-fluid
      $: render container, fluid: true
    * name: \.row
      $: render row
  cases.forEach ({name, $}) ->
    t.ok ($.has name), "should have class #name"

  t.test 'Default column width' (t) ->
    $ = render col
    name = \.col-xs
    t.ok ($.has name), "Should have default class #name"
    t.end!

  t.test 'Auto column width' (t) ->
    $ = render col, md: {push: 3} lg: push: 4 width: 6
    name = \.col-md
    t.ok ($.has name), "Should automatically assign class #name"
    t.end!

  t.test 'Auto column width without other options' (t) ->
    $ = render col, lg: \auto
    t.ok $.has \.col-lg
    t.end!

  t.test 'Column width' (t) ->
    options = xs: 12 sm: 10 md: 8 lg: 6 xl: 4
    $ = render col, options
    for vp, width of options
      selector = ".col-#vp-#width"
      t.ok ($.has selector), "should have width #{selector}"
    t.end!

  t.test 'Column positions' (t) ->
    options =
      xs: pull: 2
      sm: push: 3 size: 6
      md: offset: 4 width: 5
    $ = render col, options
    <[.pull-xs-2 .push-sm-3 .col-md-5 .col-sm-6 .offset-md-4]>forEach ->
      t.ok ($.has it), "should have class #it"
    t.end!

  t.end!
