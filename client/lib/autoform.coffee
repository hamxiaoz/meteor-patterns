AutoForm.hooks
  newEventForm:
    after:
      insert: (error, result)->
        showErrorOrContinue error, 'Event created', ->
          Router.go 'showEvent', {_id: result}

showErrorOrContinue = (error, toasterMessage, next)->
  if error?
    msg = if error.reason? then error.reason else error.toString()
    FlashMessages.sendError msg
    return

  if !!toasterMessage
    toastr.success toasterMessage

  next()