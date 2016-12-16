function display => if it then ' active in' else ''

function backdrop h, {active}
  h \div className: "modal-backdrop fade#{display active}"

function modal h, {active, dismiss, children}
  h \div className: "modal fade#{display active}" onClick: dismiss,
    h \div className: \modal-dialog,
      h \div className: \modal-content, ...children

``export {modal as default, modal, backdrop} ``
