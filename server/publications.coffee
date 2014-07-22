Meteor.publish 'events', ->
  return Events.find()

Meteor.publish 'eventTags', ->
  return EventTags.find()
