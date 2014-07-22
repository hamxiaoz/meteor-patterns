if Meteor.isClient
  FlashMessages.configure
    autoHide: false
    autoScroll: true

  toastr.options = 
    "closeButton": true,
    "debug": false
    "positionClass": "toast-top-right"
    "onclick": null
    "showDuration": '0'
    "hideDuration": '0'
    "timeOut": '3000'
    "extendedTimeOut": '0'
    "showEasing": "swing"
    "hideEasing": "linear"
    "showMethod": "slideDown"
    "hideMethod": "fadeOut"

  # spinner
  Meteor.Spinner.options = 
    lines: 9 
    top: '50%'
    length: 0

  Meteor.startup ()->
    # Initialize Mixpanel Analytics
    # mixpanel.init(Meteor.settings.public.mixpanel.token)

    # Link their account
    # Deps.autorun ()->
    #   user = Meteor.user()

    #   if not user?
    #     return

    #   mixpanel.identify(user._id)
    #   mixpanel.people.set
    #     "Name": user.emails[0].address # user.profile.firstName + ' ' + user.profile.lastName
    #     # special mixpanel property names
    #     # "$first_name": user.profile.firstName
    #     # "$last_name": user.profile.lastName
    #     "$email": user.emails[0].address
      
# TODO should remove this on production
SimpleSchema.debug = true
