get '/sessions/new' do
  if session[:user_id] != nil
    redirect "/users/#{session[:user_id]}"
  end
  erb :'/sessions/new'
end

post '/sessions' do
  #Existing users
  @user = User.find_by(email: params[:email])

  if @user.password == params[:password]
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @error = "Email/Password do not match!"
    redirect '/users'
  end
end

delete '/sessions/:id' do
  # session.clear
  logout
  redirect '/'
end
