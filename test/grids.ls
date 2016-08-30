require! assert
{container, row, col, get-class} = require \./utils


describe 'Grid system' ->
  specify '.container' ->
    assert.equal \container get-class \div container
  specify '.container-fluid' ->
    assert.equal \container-fluid get-class \div container, fluid: true

  specify '.row' ->
    assert.equal \row get-class \div row

  specify 'Column sizes .col-*-\d' ->
    opts = xs: 12 sm: 10 md: 8 lg: 6 xl: 4
    classes = get-class \div col, opts
    for viewport, width of opts
      assert //col-#viewport-#width//test classes

  specify 'Column positions .offset .pull .push' ->
    opts =
      xs: pull: 2
      sm: push: 3 size: 6
      md: offset: 4
    classes = get-class \div col, opts
    console.log classes
    for viewport, pos of opts
      for type, width of pos
        head = if type == \size then \col else type
        assert //#head-#viewport-#width//test classes

  specify 'Additional class names' ->
    class-name = 'myclass test'
    classes = get-class \div col, {class-name}
    class-name.split ' ' .forEach ->
      assert //#it//test classes
