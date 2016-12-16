function test t
  {h, render, modal} = require \./utils
  $ = render -> modal h, active: true children: [h \div className: \content]
  t.ok ($.has \.content), 'render modal with content'
  t.end!

module.exports = test
