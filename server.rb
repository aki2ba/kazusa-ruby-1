require 'webrick'
require 'json'

require_relative 'lib/stage_0/StageZeroGetServlet'
require_relative 'lib/stage_0/StageZeroServlet'
require_relative 'lib/stage_1/StageOneRedirectFromServlet'
require_relative 'lib/stage_1/StageOneRedirectToServlet'
require_relative 'lib/stage_1/StageOneServlet'
require_relative 'lib/stage_2/StageTwoPostServlet'
require_relative 'lib/stage_2/StageTwoServlet'
require_relative 'lib/HomeServlet'
require_relative 'lib/ImageServlet'

server = WEBrick::HTTPServer.new(Port: 8080)

server.mount('/', HomeServlet)

server.mount('/image', ImageServlet)

server.mount('/stage_0', StageZeroServlet)

server.mount('/stage_0/get', StageZeroGetServlet)

server.mount('/stage_1', StageOneServlet)

server.mount('/stage_1/redirect_from', StageOneRedirectFromServlet)

server.mount('/stage_1/redirect_to', StageOneRedirectToServlet)

server.mount('/stage_2', StageTwoServlet)

server.mount('/stage_2/post', StageTwoPostServlet)

# Ctrl+Cでサーバーを停止するためのシグナルハンドラを設定
trap('INT') { server.shutdown }

# サーバーを起動
server.start
