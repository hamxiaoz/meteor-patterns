Meteor.startup ->
  console.log 'config mandrill'
  Meteor.Mandrill.config
      username: "example@example.com"
      key: "key"

  Accounts.emailTemplates.siteName = 'Meteor Patterns'
  Accounts.emailTemplates.from = "Meteor Patterns <no-reply@meteor.com>"

# server method to send email via mandrill
# or you can send email using Email.send
Meteor.methods
  sendEmail: (to, subject, htmlText) ->
    console.log 'sending email...'
    Meteor.Mandrill.send
      to: to
      from: 'Meteor Patterns <no-reply@meteor.com>'
      #cc, bcc, replyTo 
      subject: subject
      html: htmlText

    console.log 'sent'
