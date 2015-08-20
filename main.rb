get '/' do
  slim :index
end

post '/' do
  # twitter = TwitterApi.new
  # user = params[:user]
  @haiku =
  slim :index
end
