require 'webrick'

class InstructionServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    response.status = 200
    response['Content-Type'] = 'text/plain;'
    response.body = File.open("./html/instruction/index.html").read
  end
end
