require 'sinatra/contrib'
require 'sinatra/base'
module MyAppModule
  class App < Sinatra::Base
    register Sinatra::Namespace
    namespace '/api/v1' do
      # get '/hello/:name' do # именованные параметры
      #   "Hello, #{params['name']}!"
      # end

      get '/redirect' do # перенаправление
        redirect to('/hello/World')
      end

      get '/hello/:name' do |n| # именованные параметры в переменных
        "Hello, #{n}!"
      end

      get '/*' do
        "I don't know what is the #{params[:splat]}. It's what you typed."
      end
    end

    get %r{/hello/([\w]+)} do |c| # регулярные выражения
      "Hi #{c}!" # TODO: не соответствует примерам
    end

    get '/say/*/to*' do # маска splat
      params['splat'].to_s
    end

    # get '/download*.*' do
    #   a = params['splat'][0]
    #   # b = ".#{params['splat'][1]}"
    #   b = params['splat'][1]
    #   # [a, b]
    # end

    get '/download*.*' do |path, ext|
      [ext, ' ', path]
    end

    get '/jobs.?:format?' do
      'Маршрут работает'
    end
  end
end
