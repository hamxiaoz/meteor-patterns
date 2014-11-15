share.Events = @Events = Events = new Mongo.Collection "events"

EventSchema = new SimpleSchema
  name:
    type: String
  tagIds:
    type: [String]

Events.attachSchema EventSchema

Events.helpers
  tags: ->
    # TODO
    return ['']
      
# those methods calls multiple methods inside the body, we don't want to use stub to simulate (the method result will be undefined if no callback is provided)
if Meteor.isServer
  Meteor.methods
    test: (a, b)->
      throw new Meteor.Error 500, 'Args cannot be empty' if not !!a
      throw new Meteor.Error 500, 'Args cannot be empty' if not !!b
      throw new Meteor.Error 500, 'Has to login to update' if not Meteor.user()?

      return true
