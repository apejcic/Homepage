express = require("express")
http = require("http")
path = require("path")

index = require("./routes/index")

app = express()

# all environments
app.set 'port', process.env.PORT || 80
app.set 'views', __dirname + '/views'
app.set 'view engine', 'jade'
app.use express.favicon(path.join(__dirname, 'public/images/favicon.ico'))
app.use express.logger('dev')
app.use express.bodyParser()
app.use express.methodOverride()
app.use app.router
app.use express.static(path.join(__dirname, 'public'), { maxAge: 3600 })

# development only
app.use express.errorHandler()  if "development" is app.get("env")

# routes
app.get '/', index.index
app.get '/message', index.message
app.post '/message', index.message

# create server
http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")
