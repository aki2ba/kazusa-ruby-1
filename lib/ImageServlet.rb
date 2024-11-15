require 'webrick'

class ImageServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    response.status = 200
    response['Content-Type'] = 'image/png'
    response.body = File.open("./image/character_touma.png").read
  end
end
