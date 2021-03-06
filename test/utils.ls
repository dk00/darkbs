require! {
  react: createElement: h
  \react-dom/server : renderToStaticMarkup: render-string
  cheerio
}

export h
export function render
  $ = cheerio.load render-string h ...
  $.has = (selector) -> ($ selector .length) > 0
  $

darkbs = (try require \../lib/index) || (try require \../darkbs)

darkbs.setup h
exports <<< darkbs
