get '/login' do
  erb :'sessions/login', layout: !request.xhr?
end

post '/login' do
  @user = User.find_by(username: params[:user][:username])

  p @user
  p params

  if @user.password == params[:user][:password]
    login(@user)
    erb :'users/show'
  else
    erb :'/sessions/login'
  end
end

get '/logout' do
  logout
  redirect '/'
end
