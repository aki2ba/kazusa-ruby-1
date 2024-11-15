require 'webrick'

class StageZeroGetServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    response.status = 404
    response['Content-Type'] = ''
    response.body = File.open("./html/index.html").read
  end
end
