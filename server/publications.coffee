# Optionally, you may want to check this.userId and call this.stop() to prevent subscriptions

Meteor.publish 'events', ->
  return Events.find()

Meteor.publish 'event', (id)->
  return Events.find {_id: id}

Meteor.publish 'eventTags', ->
  return EventTags.find()
