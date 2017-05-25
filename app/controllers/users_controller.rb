get '/users' do
  @user = current_user
  @time = Time.now.localtime
  @weather = Weather.lookup_by_location('New York, NY', Weather::Units::FAHRENHEIT)
  url = URI.parse("http://quotesondesign.com/wp-json/posts?filter[orderby]=rand&filter[posts_per_page]=1")
  res = Net::HTTP.get_response(url)
  @quote = JSON.parse(res.body)
  
  erb :"main"
end

get '/users/new' do

  erb :"users/new"
end

post "/users" do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    erb :"/main"
  else
    @errors = @user.errors.full_messages
    erb :"/settings/new"
  end
end
