mail = require './mail/local'

exports.index = (req, res) ->
  res.render 'index', title: 'Aleksander Pejčić'

exports.message = (req, res) ->
  mail.send req.body.from_email, req.body.message, (err, response) ->
    console.log err, response
    if err?
      res.send 500, { error: 'Email sending failed!' }
    else
      res.send 200, { }
  
