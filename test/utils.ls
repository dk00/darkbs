require! {
  react: createElement: h
  \react-dom/server : renderToStaticMarkup: render-string
  cheerio
}

export function render
  cheerio.load render-string h ...

export function assert-class(t, $, name)
  t.ok ($ name .length), "should have class #name"

exports <<< require \../darkbs
