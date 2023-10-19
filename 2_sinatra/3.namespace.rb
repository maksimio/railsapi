require 'rake' # порядок require важен
require 'sinatra'
require 'sinatra/namespace'

namespace '/api/v1' do
    get '/*' do
        "I don't know what is the #{params[:splat]}. It's what you typed."
    end
end