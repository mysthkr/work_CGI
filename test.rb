require 'webrick'

server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}

server.mount('/test', WEBrick::HTTPServlet::ERBHandler, 'test.html.erb')

server.mount('/indicate.cgi', WEBrick::HTTPServlet::CGIHandler, 'indicate.rb')

server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.rb')

# この一行を追記
server.mount('', WEBrick::HTTPServlet::ERBHandler, 'work.html.erb')

server.mount('/non_give.cgi', WEBrick::HTTPServlet::CGIHandler, 'non_give.rb')

server.mount('/bad_qlt.cgi', WEBrick::HTTPServlet::CGIHandler, 'bad_qlt.rb')

server.start