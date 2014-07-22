#   --- Router.configure ---------------------------------------------
Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  notFoundTemplate: 'not_found'
  # before: ->
  #   $('meta[name^="description"]').remove()


#   --- filters -----------------------------------------------------
filters =
  requireLogin: (pause)->
    # sometimes Meteor takes time to log in the user, we render the 'loading'
    # template so our render events on other page (such as home) will work
    # be sure to put this check before checking user
    if Meteor.loggingIn()
      @render 'loading'
      pause()
    else if not Meteor.user()
      @render "require_login"
      pause()

  requireAdmin: (pause)->
    if Meteor.loggingIn()
      @render 'loading'
      pause()
    else if not Meteor.user()
      @render "require_login"
      pause()
    else if not Roles.userIsInRole(Meteor.user(), ['admin'])
      @render "access_denied"
      pause()

#   --- hooks -------------------------------------------------------
Router.onBeforeAction filters.requireLogin, except: ["not_found", "admin"]
Router.onBeforeAction filters.requireAdmin, only: ["admin"]

# NOTE need to have this loading setup in order to make waitOn works: 
# https://github.com/EventedMind/iron-router/issues/537, and #554
Router.onBeforeAction 'loading'

Router.onBeforeAction -> FlashMessages.clear()

#   --- controllers -------------------------------------------------

#   --- routes ------------------------------------------------------
Router.map ->
  @route 'home',
    path: '/'
    waitOn: ->
      return [
        Meteor.subscribe('events')
      ]
    data: ->
      if @ready()
        return {
          events: Events.find {}, {sort:{'name':1}}
        }

  @route 'admin', 
    path:'/admin'
    template: 'accountsAdmin'

  @route 'debug',
    path: '/debug'

  @route 'fields',
    path: 'settings/fields'
    waitOn: ->
      return [
        Meteor.subscribe('eventTags')
      ]
    data: ->
      if @ready()
        return {
          eventTags: EventTags.find {}, {sort:{'name':1}}
        }

  @route 'tools',
    path: 'settings/tools'
 
 
