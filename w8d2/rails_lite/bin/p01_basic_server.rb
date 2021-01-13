require 'rack'

# Rack::Server.start(
#   app: Proc.new do |env|
#     ['200', {'Content-Type' => 'text/html'}, ['hello world']]
#   end
# )

# app = Proc.new do |env|
#   req = Rack::Request.new(env)
#   res = Rack::Response.new
#   res['Content-Type'] = 'text/html'
#   res.write("Hello world!")
#   res.finish
# end

class MyController 
  def execute(req, res)
    if req.path == '/i/love/app/academy'
      res.write('/i/love/app/academy')
    else
      res.write("Hello world!")
    end
  end
end

controlled_app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new 
  MyController.new.execute(req, res)
  # if req.path == '/i/love/app/academy'
  #   res.write('/i/love/app/academy')
  # else
  #   res.write("Hello world!")
  # end
  res.finish 
end

Rack::Server.start(
  app: controlled_app,
  Port: 3000
)