get '/login' do
  if request.xhr?
    erb :"/settings/login", layout: false
  else
    erb :"/settings/login"
  end
end

post '/login' do
  @user = User.find_by(username: params[:user][:username])

if request.xhr?
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id

    erb :"/main"
  else
    @errors = ["Wrong password", "Wrong username"]
    erb :"/settings/login", layout: false
  end

else
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id

    erb :"/main"
  else
    @errors = ["Wrong password", "Wrong username"]
    erb :"/settings/login"
  end
end 
end

get '/logout' do
  session.clear
  redirect '/'
end
