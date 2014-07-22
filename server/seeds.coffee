# seed data: it'll run immediately when the server starts
Meteor.startup ->
  admin = Meteor.users.findOne { emails: { $elemMatch: { address: "admin@example.com" } } }
  if not admin?
    console.log 'creating admin'
    id = Accounts.createUser
      email: 'admin@example.com'
      password: '00000000'
    
    console.log 'adding admin@example.com to "view-debug-menu"'
    Roles.addUsersToRoles id, ['view-debug-menu']
