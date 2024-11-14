require 'webrick'
require 'json'
# サーバーの設定
server = WEBrick::HTTPServer.new(Port: 8080)

# "/"
class HomeServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    response.status = 200
    response['Content-Type'] = 'text/html; charset=utf-8'
    response.body = File.open("./html/index.html").read
  end
end

server.mount('/', HomeServlet)

# "/stage_0"
class StageZeroServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    response.status = 200
    response['Content-Type'] = 'text/html; charset=utf-8'
    response.body = File.open("./html/stage_0/index.html").read
  end
end

server.mount('/stage_0', StageZeroServlet)

class StageZeroGetServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    response.status = 404
    response['Content-Type'] = ''
    response.body = File.open("./html/index.html").read
  end
end

server.mount('/stage_0/get', StageZeroGetServlet)

# "/stage_1"
class StageOneServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    response.status = 200
    response['Content-Type'] = 'text/html; charset=utf-8'
    response.body = File.open("./html/stage_1/index.html").read
  end
end

server.mount('/stage_1', StageOneServlet)

class StageOneRedirectFromServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    response.status = 200
    response['Content-Type'] = 'text/html; charset=utf-8'
    response.body = File.open("./html/stage_1/redirect_from/index.html").read
  end
end

server.mount('/stage_1/redirect_from', StageOneRedirectFromServlet)

class StageOneRedirectToServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    response.status = 200
    response['Content-Type'] = 'text/html; charset=utf-8'
    response.body = File.open("./html/stage_1/redirect_to/index.html").read
  end
end

server.mount('/stage_1/redirect_to', StageOneRedirectToServlet)

# "/stage_2"
class StageTwoServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    response.status = 200
    response['Content-Type'] = 'text/html; charset=utf-8'
    response.body = File.open("./html/stage_2/index.html").read
  end
end

server.mount('/stage_2', StageTwoServlet)

class StageTwoPostServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_POST(request, response)
    response.status = 200
    response['Content-Type'] = 'text/html; charset=utf-8'
    response.body = File.open("./html/stage_2/post/index.html").read
  end
end

server.mount('/stage_2/post', StageTwoPostServlet)

# 新しいサーブレットを作成
class ImageServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    response.status = 200
    response['Content-Type'] = 'image/png'
    response.body = File.open("./image/character_touma.png").read
  end
end

server.mount('/image', ImageServlet)


# Ctrl+Cでサーバーを停止するためのシグナルハンドラを設定
trap('INT') { server.shutdown }

# サーバーを起動
server.start

