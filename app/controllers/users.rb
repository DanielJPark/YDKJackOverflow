get '/users/new' do
	erb :'users/new'
end

post '/users' do
	@user = User.new(params[:user])
	if @user.save
		redirect "/users/login"
	else
    erb :'users/new'
	end
end

get '/logout' do
	session.clear
	redirect '/'
end

get '/users/login' do 
	erb :'users/login'
end 

post '/users/login' do 
@user = User.find_by(email: params[:email])
	if @user
		if @user.authenticate(params[:password])
	 		session[:user_id] = @user.id
	 		redirect "/user/show/#{session[:user_id]}"
		else
   		erb :'users/login'
		end
	else 
		redirect '/users/new'
	end
end 