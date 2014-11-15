Blaze.registerHelper 'sessionGet', (input, subKey)->
  obj = Session.get(input)
  if obj? 
    return obj[subKey] 
  else 
    return obj

Blaze.registerHelper 'dateStr', (date)->
  return moment(date).format('L')

Blaze.registerHelper 'dateStrFull', (date)->
  return moment(date).format('MM/DD/YYYY LT')

# Outputs e.g. 12 days ago or 2 hours ago
Blaze.registerHelper 'showTimeAgo', (date)->
  return moment(date).fromNow()

# Outputs e.g. Jan, 2013
Blaze.registerHelper 'showMonthYear', (date)->
  return moment(date).format("MMM, YYYY")

# Outputs e.g. 12th Jan, 2013
Blaze.registerHelper 'showDayMonthYear', (date)->
  return moment(date).format("Do MMM, YYYY")

# Outputs August 30th 2014, 5:33:46 pm
Blaze.registerHelper 'showPrettyTimestamp', (date)->
  return moment(date).format("MMMM Do YYYY, h:mm:ss a")

Blaze.registerHelper 'acronymEmail', (email)->
  if email?
    return email.substring(0,2).toUpperCase()
  else
    return ''

Blaze.registerHelper 'rev', ->
  return 'rev ' + Meteor.settings.public.rev

# Utility

Blaze.registerHelper 'humanizeBoolean', (booleanValue)->
  if booleanValue 
    return 'Yes'
  else
    return 'No'

Blaze.registerHelper 'activeIf', (str1, str2)->
  if str1 == str2 then return 'active' else return ''

# HACK you cannot write array in template and use it in helper
# http://stackoverflow.com/questions/16783463/pass-array-written-in-template-to-meteor-handlebars-helper
# doens't work:
#   li(class="{{activeIf CurrentPathName ['tools', 'directDownload', 'essUsage'] }}")
Blaze.registerHelper 'activeIfStarts', (str1, str2)->
  if str1.startsWith str2 then return 'active' else return ''

Blaze.registerHelper 'ifThen', (cp1, cp2, strWhenTrue, strWhenFalse)->
  if cp1 == cp2 then return strWhenTrue else return strWhenFalse

# TODO use underscore.string?
Blaze.registerHelper 'idfy', (str)->
  return idEncode(str, '')

# TODO use underscore.string?
Blaze.registerHelper 'idfy', (str, str2, str3)->
  return idEncode(str+str2+str3, '') 

# TODO use https://github.com/zimme/meteor-iron-router-active?
# get path name: 'debug', instead of '/debug'
Blaze.registerHelper 'currentPathName', ->
  current = Router.current()
  if current? then return current.route.getName() else return ''

# TODO use https://github.com/zimme/meteor-iron-router-active?
# get the path: '/a/bc'
Blaze.registerHelper 'currentPath', ->
  current = Router.current()
  if current? then return current.route._path else return ''

# autoform delete form requires random id: https://github.com/aldeed/meteor-autoform/issues/256
Blaze.registerHelper "deleteID", ->
  return Random.id()

# app specific
# ============
