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

  specify 'Additional class names' ->
    class-name = 'myclass test'
    classes = get-class \div col, {class-name}
    class-name.split ' ' .forEach ->
      assert //#it//test classes
