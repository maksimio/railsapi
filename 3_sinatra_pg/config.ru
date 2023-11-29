root = File.expand_path File.dirname(__FILE__)

require File.join( root, 'api_sinatra_postgres.rb' )
require File.join( root, 'api_sinatra.rb' )

run Sinatra::Application
