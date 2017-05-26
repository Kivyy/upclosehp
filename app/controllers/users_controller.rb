get '/users' do
  RSpotify.authenticate("7832b4c5dc444fc48d9d5dd39399f34e", "1dfd789498394e4db162963b9be32626")
  @user = current_user
  @time = Time.now.localtime
  @weather = Weather.lookup_by_location('New York, NY', Weather::Units::FAHRENHEIT)
  url = URI.parse("http://quotesondesign.com/wp-json/posts?filter[orderby]=rand&filter[posts_per_page]=1")
  res = Net::HTTP.get_response(url)
  @quote = JSON.parse(res.body)
  recommendations = RSpotify::Playlist.find('spotify','37i9dQZEVXcDeHwOaoXSxp')
  @track = recommendations.tracks_cache[rand(19)]
  @song = @track.external_urls["spotify"]
  erb :"main"
end

get '/users/new' do

  erb :"users/new"
end

post "/users" do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    erb redirect '/users'
  else
    @errors = @user.errors.full_messages
    erb :"/users/new"
  end
end
