AutoForm.hooks
  newEventForm:
    after:
      insert: (error, result)->
        showErrorOrContinue error, 'Event created', ->
          Router.go 'showEvent', {_id: result}

  editEventForm:
    before:
      update: (docId, modifier, template)->
        Session.set 'editEventForm._id', docId
        return modifier

    after:
      insert: (error, result)->
        showErrorOrContinue error, 'Event updated', ->
          id = Session.get 'editEventForm._id'
          Session.set 'editEventForm._id', null
          Router.go 'showEvent', {_id: result}

showErrorOrContinue = (error, toasterMessage, next)->
  if error?
    msg = if error.reason? then error.reason else error.toString()
    FlashMessages.sendError msg
    return

  if !!toasterMessage
    toastr.success toasterMessage

  next()