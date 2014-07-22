# https://github.com/awatson1978/meteor-cookbook/blob/master/cookbook/database-migrations.md
Migrations = new Meteor.Collection('migrations')

Meteor.startup ->
  _.each _.keys(migrationsList), (migrationName)->
    runMigration migrationName

# wrapper function for all migrations
runMigration = (migrationName)->
  if !Migrations.findOne {name: migrationName}
    console.log("//----------------------------------------------------------------------//")
    console.log("//------------//    Starting "+migrationName+" Migration    //-----------//")
    console.log("//----------------------------------------------------------------------//")
    Migrations.insert({name: migrationName, startedAt: new Date(), completed: false});

    # execute migration function
    itemsAffected = migrationsList[migrationName]() || 0

    Migrations.update({name: migrationName}, {$set: {finishedAt: new Date(), completed: true, itemsAffected: itemsAffected}})
    console.log("//----------------------------------------------------------------------//")
    console.log("//------------//     Ending "+migrationName+" Migration     //-----------//")
    console.log("//----------------------------------------------------------------------//")

# actuall migrations
migrationsList =
  test: ->
    return 0
