mandrill = require('node-mandrill')(process.env.MANDRILL_KEY)

exports.send = (from, message, cb) ->
  mandrill '/messages/send',
    message:
      to: [
        email: "me@apejcic.com"
        name: "Aleksander Pejcic"
      ]
      from_email: from
      subject: "Message from homepage"
      text: message
  , (err, res) ->
    if err?
      cb err, res
    else
      if res[0].status is 'sent'
        cb null, res
      else
        cb true, res
