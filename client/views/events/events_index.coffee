# This callback is called once when an instance of Template.myTemplate is rendered into DOM nodes and put into the document for the first time.
# In the body of the callback, this is a template instance object 
# Template.events.rendered = ->
  # console.log this

Template.events.helpers
  beforeRemove: ->
    return (collection, id)->
      if confirm 'Delete?'
        this.remove()

  onErrorRemove: ->
    return (error)->
      FlashMessages.sendError error
        
  onSuccessRemove: ->
    return (result)->
      toastr.success 'Event deleted'

# Template.events.events
