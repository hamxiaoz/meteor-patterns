Reason: the long list is a big list and it takes time to render. Here is the solution to render only when the modal is shown.

Main UI

```jade
a(href='#' data-modal-id='supported')#launch-modal View
+viewSupportedModal id='supported' renderToggler='supported.render' longList=things
```

```coffeescript
Template.main.events
  'click #launch-modal': (e)->
    e.preventDefault()

    id = $(e.target).attr('data-modal-id')
    $("##{id}").modal 'show'
```

Template

```jade
template(name='viewSupportedModal')
  .modal(id="{{id}}", data-renderToggler="{{renderToggler}}" tabindex="-1", role="dialog", aria-hidden="true")
    .modal-dialog
      .modal-content
        .modal-header
          button.close.close-modal(type="button")
            span(aria-hidden="true") &times;
            span.sr-only Close
          h4.modal-title Supported 
        .modal-body
          if $.Session.get renderToggler
            .row
              .col-md-12
                ul
                  each longList
                    li #{this}
          else
            ul
              li.text-muted loading...
        .modal-footer
          button.btn.btn-default.btn-link.close-modal(type="button")
            span.text-muted Close
```


```js
Template.viewSupportedModal.rendered = ->
  $('.modal').on 'shown.bs.modal', (e)->
    Session.set $('.modal').attr('data-renderToggler'), true

Template.viewSupportedModal.events
  'click .close-modal': (e)->
    e.preventDefault()

    $('.modal').modal 'hide'
    Session.set $('.modal').attr('data-renderToggler'), false
```
