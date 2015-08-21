require 'sinatra'
require_relative 'config/environment'

Slim::Engine.options[:pretty] = true

get '/' do
  slim :index
end

post '/' do
  # user = params[:user]
  haiku = Haiku.new
  @poem = haiku.create_poem
  slim :index
end
