require! assert
{gen, class-name} = require \./darkbs

describe 'Utility classes' ->
  all = class-name do
    text: <[nowrap lowercase]>
    hidden:
      down: \sm
      up: \lg
    active: true

  specify '.active class' ->
    assert /active/test all

  specify '.hidden-*-{up|down}' ->
    down-only = class-name hidden: \xs
    up-only = class-name hidden: up: \md

    [/hidden-sm-down/ /hidden-lg-up/]forEach ->
      assert it.test all
    assert.equal \hidden-xs-down down-only
    assert.equal \hidden-md-up up-only

  specify '.text-*' ->
    [/nowrap/ /lowercase/]forEach ->
      assert it.test all
