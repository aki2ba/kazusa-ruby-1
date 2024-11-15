require 'webrick'

class HomeServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    response.status = 200
    response['Content-Type'] = 'text/html; charset=utf-8'
    response.body = File.open("./html/index.html").read
  end
end