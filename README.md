# darkbs

Dark color scheme & some functional [Bootstrap][bs] [components][react]

[![NPM version][npm-image]][npm-url]
[![build status][travis-image]][travis-url]
[![coverage][codecov-image]][codecov-url]
[![dependencies][dm-image]][dm-url]

[bs]: https://github.com/twbs/bootstrap
[react]: https://github.com/facebook/react
[travis-image]: https://travis-ci.org/dk00/darkbs.svg?branch=master
[travis-url]: https://travis-ci.org/dk00/darkbs
[npm-image]: https://img.shields.io/npm/v/darkbs.svg
[npm-url]: https://www.npmjs.com/package/darkbs
[codecov-image]: https://codecov.io/gh/dk00/darkbs/branch/master/graph/badge.svg
[codecov-url]: https://codecov.io/gh/dk00/darkbs
[dm-image]: https://david-dm.org/dk00/darkbs.svg
[dm-url]: https://david-dm.org/dk00/darkbs


## Color Scheme

Black background color scheme, overrides colors only.
Use this by loading the compiled css after Bootstrap.

```html
<link rel="stylesheet" href="//unpkg.com/darkbs/darkbs.css">
```


## Top-Level API

### `className(options)`
`Object` → `String`

- `options` &lt;Object&gt; | &lt;String&gt;
  - [ ] spacing
  - [ ] `list` &lt;Object&gt;
    - `inline`
    - `unstyled`
  - [x] `text` &lt;Array&gt;
    Add `text-` classes
  - [ ] `text` &lt;Object&gt;
    - [ ] `align`
    - [ ] `transform`
    - [ ] `color`
    - [ ] `truncate`
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
    - `down`, `up`
    Add `.hidden-*-down` and `.hidden-*-up`.

A structural way to use utilitiy classes, return Bootstrap class names.

### `element([{tagName='div', className}])`
`Object` → `ReactElement`

- `tagName` &lt;String&gt; | &lt;ReactClass&gt;
  The first argument to pass to `h()` or `createElement()`, can be anything
  acceptable by that.
- `className` &lt;Object&gt; | &lt;String&gt;
  All options specified in `className()` are available.

Base component to create arbitrary elements.


## Layout

### `container({[fluid=false]})`

- `fluid`: Use `true` for a full width container

### `row()`

### `col([{xs, sm, md, lg, xl}])`
- `xs`, `sm`, `md`, `lg`, `xl` &lt;Number&gt; | &lt;Object&gt;
  - `width`
  Column width, valid values are `1..12` or `'auto'`.
  - `size`
  Alias for `width`
  - `offset`, `push`, `pull`
  Column position

For the smallest viewport with options, if `width` or `size` is not set,
`col-*` will be automatically added for it.
Subject to change with [Flexbox grid system][flex].

[flex]: http://v4-alpha.getbootstrap.com/layout/flexbox-grid/


## Components

### `button([{color, size, outline, block}])`
- [x] `color`
- [ ] `size`
- [ ] `outline`
- [ ] `block`

### `tag([options])`
- [x] `color`
- [x] `pill`
