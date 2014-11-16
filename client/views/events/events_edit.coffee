# This callback is called once when an instance of Template.myTemplate is rendered into DOM nodes and put into the document for the first time.
# In the body of the callback, this is a template instance object 
# Template.showEvent.rendered = ->

# Template.events.helpers

Template.editEvent.events
  'click .cancel': (e)->
    e.preventDefault()
    history.go(-1)
