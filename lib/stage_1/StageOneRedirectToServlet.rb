require 'webrick'

class StageOneRedirectToServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    response.status = 200
    response['Content-Type'] = 'text/html; charset=utf-8'
    response.body = File.open("./html/stage_1/redirect_to/index.html").read
  end
end
