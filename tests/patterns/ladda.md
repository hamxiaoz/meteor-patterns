How to use [ladda.js](https://github.com/hakimel/Ladda)

```jade
button.btn.btn-danger.ladda-button#fetch(type='button', data-style="zoom-out")
  span.ladda-label Refresh
```

```coffee
'click #fetch': (e)->
    e.preventDefault()

    return if not window.confirm 'Continue?'

    ladda = Ladda.create $(e.currentTarget).get(0)
    ladda.start()
    Meteor.call 'fetch', (err, result)->
      ladda.stop()
      if err
        FlashMessages.sendError err.reason
        return
      toastr.success 'Refreshed'
```

