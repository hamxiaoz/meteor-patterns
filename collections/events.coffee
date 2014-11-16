share.Events = @Events = Events = new Mongo.Collection "events"

EventSchema = new SimpleSchema
  name:
    type: String
  details:
    type: String
    label: 'Details (optional)'
    optional: true
  createdAt:
    type: Date
    defaultValue: new Date()
    denyUpdate: true
  updatedAt:
    type: Date
    denyInsert: true
    optional: true
    autoValue: ->
      if this.isUpdate
        return new Date()
  tagIds:
    type: [String]
    optional: true

Events.attachSchema EventSchema

Events.helpers
  tags: ->
    # TODO
    return ['']

# Authorization for client side request
Events.allow
  insert: (userId, doc)->
    return true
  update: (userId, doc, fieldNames, modifier)->
    return true
  remove: (userId, doc)->
    # return Roles.userIsInRole userId, ['admin']
    return true
      
# those methods calls multiple methods inside the body, we don't want to use stub to simulate (the method result will be undefined if no callback is provided)
if Meteor.isServer
  Meteor.methods
    test: (a, b)->
      throw new Meteor.Error 500, 'Args cannot be empty' if not !!a
      throw new Meteor.Error 500, 'Args cannot be empty' if not !!b
      throw new Meteor.Error 500, 'Has to login to update' if not Meteor.user()?

      return true
