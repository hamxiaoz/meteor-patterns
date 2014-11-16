#   --- Router.configure ---------------------------------------------
Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  notFoundTemplate: '404'
  # TODO enable this to use ga
  # trackPageView: true # https://github.com/reywood/meteor-iron-router-ga


#   --- filters -----------------------------------------------------
filters =
  requireLogin: ->
    # sometimes Meteor takes time to log in the user, we render the 'loading'
    # template so our render events on other page (such as home) will work
    # be sure to put this check before checking user
    if Meteor.loggingIn()
      @render 'loading'
    else if not Meteor.user()
      @render "require_login"
    else
      @next()

  requireAdmin: ->
    if Meteor.loggingIn()
      @render 'loading'
    else if not Meteor.user()
      @render "require_login"
    else if not Roles.userIsInRole(Meteor.user(), ['admin'])
      @render "access_denied"
    else
      @next()

#   --- hooks -------------------------------------------------------
Router.onBeforeAction filters.requireLogin, except: ["not_found", "admin"]
Router.onBeforeAction filters.requireAdmin, only: ["admin"]

Router.onBeforeAction -> 
  FlashMessages.clear()
  @next()

#   --- controllers -------------------------------------------------

#   --- routes ------------------------------------------------------
Router.route '/',
  name: 'home'

Router.route '/admin',
  name: 'admin' 
  template: 'accountsAdmin'

Router.route '/debug',
  name: 'debug'

Router.route '/settings/fields',
  name: 'fields'
  waitOn: ->
    return [
      Meteor.subscribe('eventTags')
    ]
  data: ->
    if @ready()
      return {
        eventTags: EventTags.find {}, {sort:{'name':1}}
      }

Router.route '/settings/tools',
  name: 'tools'

# RESTfule for events
Router.route '/events',
  name: 'events'
  waitOn: ->
    return [
      Meteor.subscribe('events')
    ]
  data: ->
    if @ready()
      return {
        allEvents: Events.find {}, {sort:{'createdAt':1}}
      }

# NOTE the order is important, put this route before the show and edit ones
Router.route '/events/new',
  name: 'newEvent'
 
Router.route '/events/:_id',
  name: 'showEvent'
  waitOn: ->
    return [
      Meteor.subscribe 'event', @params._id
    ]
  data: ->
    if @ready()
      return {
        event: Events.findOne @params._id
      }
 
Router.route '/events/:_id/edit',
  name: 'editEvent'
  waitOn: ->
    return [
      Meteor.subscribe 'event', @params._id
    ]
  data: ->
    if @ready()
      return {
        event: Events.findOne @params._id
      }
 
