require 'webrick'

class StageTwoPostServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_POST(request, response)
    response.status = 200
    response['Content-Type'] = 'text/html; charset=utf-8'
    response.body = File.open("./html/stage_2/post/index.html").read
  end
end
