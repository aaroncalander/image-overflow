get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    login(@user)
    redirect '/users/profile'
  else
    erb :'users/new'
  end
end

get '/users/profile' do
  erb :'users/show'
end
