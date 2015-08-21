require 'sinatra'
require_relative 'config/environment'

Slim::Engine.options[:pretty] = true

get '/' do
  slim :index
end

post '/' do
  # user = params[:user]
  haiku = Haiku.new
  haiku.create_poem
  @first_line = haiku.first_line
  @second_line = haiku.second_line
  @third_line = haiku.third_line
  slim :index
end
