get '/' do
	@user = User.all
	p @user
	@session = session[:user_id]
	erb :index
end

