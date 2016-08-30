h = require \react .createElement
render-string = require \react-dom/server .renderToStaticMarkup
cheerio = require \cheerio .load
export gen = (selector, type, options) ->
  (cheerio . render-string . h) type, options <| selector
export get-class = ->
  gen ... .attr \class

exports <<< require \../darkbs
