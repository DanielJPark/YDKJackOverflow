get '/users/new' do
  erb :'users/new'
end

post '/users' do

  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    session[:email] = @user.email
    session[:username] = @user.username
    redirect "/"
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/login' do
  @email = session[:username]
  erb :'users/login'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

post '/users/login' do
  @user = User.find_by(email: params[:email])
  if @user
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{session[:user_id]}"
    else
      @errors = "Incorrect Username / Password"
      erb :'users/login'
    end
  else
    @errors = "Incorrect Username / Password"
    erb :'users/login'
  end
end
