require! tape
{render, tag} = require \./utils

tape \Tags (t) ->
  do ->
    $ = render tag, \tag
    t.ok ($.has \.tag), 'base class'
    t.ok ($.has \.tag-default), 'default color'
    t.ok ($.has \span), 'default tag'

  do ->
    $ = render tag, color: \info pill: true
    t.ok ($.has \.tag-pill), 'pill tags'
    t.ok ($.has \.tag-info), 'contextual colors'
    t.ok (!$.has \.tag-default), 'replace default color'

  t.end!



