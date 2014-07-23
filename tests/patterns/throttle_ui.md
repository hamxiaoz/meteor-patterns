Throttle the function called on user inputs.

```jade
form#form
  input.form-control.search-string(type='text', placeholder='search')
  button.btn.btn-primary(type='submit') Go
```

```coffeescript
Template.view.events
  'input .search-string': (e)->
    updateButtonEnabled(e)

# update button disabled status no more than 2 times per second
updateButtonEnabled = 
  _.throttle ((e)->
    if !!$(e.target).val()
      $('#form button[type="submit"]').removeClass 'disabled'
    else
      $('#form button[type="submit"]').addClass 'disabled'
  ), 500

```

