require 'sinatra'

FILENAME = './spec.yaml'

get '/editor/spec' do
  body = File.read(FILENAME)
  [200, body]
end

put '/editor/spec' do
  new_content = request.body.read
  File.open(FILENAME, 'w') { |f| f.write new_content }
  [201, new_content]
end

run Sinatra::Application
