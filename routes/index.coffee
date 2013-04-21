mandrill = require('node-mandrill')(process.env.MANDRILL_KEY)

exports.index = (req, res) ->
  res.render 'index', title: 'Aleksander Pejčić'

exports.message = (req, res) ->
  mandrill '/messages/send',
    message:
      to: [
        email: "apejcic@gmail.com"
        name: "Aleksander Pejcic"
      ]
      from_email: "#{req.body.from_email}"
      subject: "Message from homepage"
      text: "#{req.body.message}"
  , (error, response) ->
    if error
      console.error error
      res.send 500, { error: 'Email not sent!' }
    else
      if response[0].status is 'sent'
        res.send 200, { }
      else
        console.error response;
        res.send 400, { error: 'Email not sent!' }

  