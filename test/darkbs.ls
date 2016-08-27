h = require \react .createElement
render-string = require \react-dom/server .renderToStaticMarkup
cheerio = require \cheerio .load
export gen = cheerio . render-string . h
exports <<< require \../darkbs
