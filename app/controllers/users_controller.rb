get '/users' do
  @users = User.all

  erb :index
end

get '/users/new' do
  erb :'users/new'
end



get '/users/:id' do
  # Access profile or site
  @user = User.find(params[:id])
  # if session.empty?
  #   redirect "/sessions/new"
  if session[:user_id] != @user.id
    redirect '/sessions/new'
  #   redirect "/users/#{@user.id}"
  end
  erb :'users/show'
end

post '/users' do
  #Create users
  @user = User.new(params[:user])
  @user.password = params[:user][:password]
  @user.save!
  session[:user_id] = @user.id
  redirect "/users/#{@user.id}"
end


