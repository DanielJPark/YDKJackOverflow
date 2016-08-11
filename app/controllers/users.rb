get '/users/new' do
	erb :'users/new'
end

post '/users' do
	@user = User.new(params[:user])
	if @user.save
		session[:user_id] = @user.id
    redirect "/"
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/logout' do
  session[:user_id] = nil 
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
      redirect "/users/show/#{session[:user_id]}"
    else
      @errors = "Incorrect Username / Password"
      erb :'users/login'
    end
  else 
    @errors = "Incorrect Username / Password"
    erb :'users/login'
  end
end 