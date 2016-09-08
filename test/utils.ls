require! {
  react: createElement: h
  \react-dom/server : renderToStaticMarkup: render-string
  cheerio
}

export function render
  $ = cheerio.load render-string h ...
  $.has = (selector) -> ($ selector .length) > 0
  $

darkbs = require \../darkbs
darkbs.setup h
exports <<< darkbs
