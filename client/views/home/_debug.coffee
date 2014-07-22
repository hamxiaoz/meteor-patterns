Template.debug.events
  'click #debug': (e)->
    e.preventDefault()

    toastr.success 'haha'
