email = require 'emailjs'

exports.send = (from, message, cb) ->
  server = email.server.connect
    host: 'localhost'
    ssl: false

  server.send
    text: message
    from: from
    to: 'me@apejcic.com'
    subject: 'Message from homepage'
  , cb
