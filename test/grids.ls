require! assert
{container, row, col, gen} = require \./darkbs

describe 'Grid system' ->
  specify '.container' ->
    assert.equal \container ((gen container) \div .attr \class)
  specify '.container-fluid' ->
    assert.equal \container-fluid ((gen container, fluid: true) \
      \div .attr \class)

  specify '.row' ->
    assert.equal \row ((gen row) \div .attr \class)

  specify 'Column sizes .col-*-\d' ->
    opts = xs: 12 sm: 10 md: 8 lg: 6 xl: 4
    classes = (gen col, opts) \div .attr \class
    for viewport, width of opts
      assert //col-#viewport-#width//test classes

  specify 'Additional class names' ->
    class-name = 'myclass test'
    classes = (gen col, {class-name}) \div .attr \class
    class-name.split ' ' .forEach ->
      assert //#it//test classes
