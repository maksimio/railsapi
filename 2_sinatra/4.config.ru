root = File.expand_path File.dirname(__FILE__)
require File.join( root, '4.my_sinatra.rb')

app = Rack::Builder.app do
    run MyAppModule::App
end

run app
# sudo bundle exec rackup -p 4567 4.config.ru