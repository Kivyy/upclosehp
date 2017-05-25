get '/login' do

  erb :"/settings/login"
end

post '/login' do
  @user = User.find_by(username: params[:user][:username])

  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id

    erb :"/main"
  else
    @errors = ["Wrong password", "Wrong username"]
    erb :"/settings/login"
  end
end
