# darkbs

Dark color scheme & some functional [Bootstrap] [components][react]

[![NPM version][npm-image]][npm-url]
[![build status][travis-image]][travis-url]

[Bootstrap]: https://github.com/twbs/bootstrap
[react]: https://github.com/facebook/react
[travis-image]: https://travis-ci.org/dk00/darkbs.svg?branch=master
[travis-url]: https://travis-ci.org/dk00/darkbs
[npm-image]: https://img.shields.io/npm/v/darkbs.svg
[npm-url]: https://www.npmjs.com/package/darkbs

## Color Scheme

Black background color scheme, overrides colors only.
Use this by loading the compiled css after Bootstrap.

'''html
<link rel="stylesheet" href="//npmcdn.com/darkbs/dist/darkbs.css">
'''

## Class Names

### `className(options)`
`Object` → `String`
- `options` &lt;Object&gt;
  - [ ] spacing
  - [x] `text` &lt;Array&gt;
    Add `text-` classes
  - [ ] `text` &lt;Object&gt;
    - [ ] `align`
    - [ ] `transform`
    - [ ] `color`
  - [ ] `color`
  - [ ] `font`
  - [ ] `bg`, `background`
  - [ ] `w`, `width`
  - [ ] `d`, `display`
  - [ ] `pull`
  - [ ] `clearfix`
  - [ ] `pos`, `position`
  - [ ] `invisible`
  - [ ] `sr`, `readerOnly`
  - [ ] `embed`, `embedResponsive`
  - [x] `active` &lt;Boolean&gt;
  - [x] `hidden` &lt;String&gt;
    - `down`
    - `up`
    Add `.hidden-*-down` and `.hidden-*-up`.

A structural way to use utilitiy classes, return Bootstrap class names.
Almost all other elements also accept these options.


## Layout

### `container({[fluid=false]})`
`Object` → `ReactElement`
- `fluid`: Use `true` for a full width container

### `row([props])`

### `col([{xs, sm, md, lg, xl}])`
- `xs`, `sm`, `md`, `lg`, `xl`
  - [x] `size`
  - [ ] `offset`
  - [ ] `pull`


## Components

### `button([{color, size, outline, block}])`
- [x] `color`
- [ ] `size`
- [ ] `outline`
- [ ] `block`