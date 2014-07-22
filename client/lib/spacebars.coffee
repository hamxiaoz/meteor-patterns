UI.registerHelper 'sessionGet', (input, subKey)->
  obj = Session.get(input)
  if obj? 
    return obj[subKey] 
  else 
    return obj

UI.registerHelper 'dateStr', (date)->
  return moment(date).format('L')

UI.registerHelper 'dateStrFull', (date)->
  return moment(date).format('MM/DD/YYYY LT')

UI.registerHelper 'acronymEmail', (email)->
  if email?
    return email.substring(0,2).toUpperCase()
  else
    return ''

UI.registerHelper 'rev', ->
  return 'rev ' + Meteor.settings.public.rev

# Utility

UI.registerHelper 'humanizeBoolean', (booleanValue)->
  if booleanValue 
    return 'Yes'
  else
    return 'No'

UI.registerHelper 'activeIf', (str1, str2)->
  if str1 == str2 then return 'active' else return ''

# HACK you cannot write array in template and use it in helper
# http://stackoverflow.com/questions/16783463/pass-array-written-in-template-to-meteor-handlebars-helper
# doens't work:
#   li(class="{{activeIf CurrentPathName ['tools', 'directDownload', 'essUsage'] }}")
UI.registerHelper 'activeIfStarts', (str1, str2)->
  if str1.startsWith str2 then return 'active' else return ''

UI.registerHelper 'ifThen', (cp1, cp2, strWhenTrue, strWhenFalse)->
  if cp1 == cp2 then return strWhenTrue else return strWhenFalse

UI.registerHelper 'idfy', (str)->
  return idEncode(str, '')

UI.registerHelper 'idfy', (str, str2, str3)->
  return idEncode(str+str2+str3, '') 

# get path name: 'debug', instead of '/debug'
UI.registerHelper 'currentPathName', ->
  current = Router.current()
  if current? then return current.route.name else return ''

# get the path: '/a/bc'
UI.registerHelper 'currentPath', ->
  current = Router.current()
  if current? then return current.path else return ''

# app specific
# ============
