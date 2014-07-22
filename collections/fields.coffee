@EventTags = new Meteor.Collection "eventTags",
  schema: new SimpleSchema
    name:
      type: String
      min: 1

EventTags.allow
  insert: (userId, doc)->
    return true if userId?
  update: (userId, doc, fieldNames, modifier)->
    return true if userId?
  remove: (userId, doc)->
    return true if userId?


