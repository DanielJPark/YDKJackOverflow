get '/categories/:cid/questions/new' do
	if logged_in?
		@category = Category.find(params[:cid])
		@all_categories = Category.order(:title)
		erb :'/questions/new'
	else
		redirect '/users/login'
	end
end

get '/questions/new' do
	if logged_in?
		@all_categories = Category.order(:title)
		erb :'/questions/new'
	else
		redirect 'users/login'
	end
end

post '/questions' do
	if logged_in?
    @question = Question.new(params[:question])
    if @question.save
      redirect "/questions/#{@question.id}"
    else
      @all_categories = Category.order(:title)
      @errors = @question.errors.full_messages
      erb :'/questions/new'
    end
  else
    redirect 'users/login'
  end
end

get '/questions/:id' do
	@question = Question.find(params[:id])
    if @question.user == User.find_by(username: "Anonymous")
		  @question.title = "[This Question was deleted by user]"
		  @question.content = "[This Question was deleted by user]"
    end

    if @question.selected_answer
		  @selected_answer = @question.selected_answer
		  @answers = @question.answers.select { |a| a.id != @selected_answer.id }
    else
      @selected_answer = nil
      @answers = @question.answers
    end
  erb :'/questions/show'
end

put '/questions/:id/edit' do

end

delete '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  if logged_in? && current_user == @question.user
    if @question.answers.count == 0 && @question.comments.count == 0
      @question.destroy
      redirect '/'
    else
      @question.user = User.find_or_create_by(username: "Anonymous", email: "anonymous@anonymous.com", hashed_password: "password")
      @question.save
      redirect "/questions/#{params[:id]}"
    end
  else
    redirect 'users/login'
  end
end

post '/questions/:id/vote' do
  if logged_in?
    question = Question.find(params[:id])
    Vote.create(value: 1, post: question, user: current_user)
    redirect "/questions/#{params[:id]}"
  else
    redirect 'users/login'
  end
end

get '/questions/:id/comments/new' do
  @question = Question.find(params[:id])
  @comments = @question.comments
  @post_id = params[:id]
  @post_type = "questions"
  erb :'questions/newComment'
end

post '/questions/:id/comments' do
  if logged_in?
    new_comment = Comment.new(params[:comment])
    new_comment.user = current_user
    new_comment.post_type = "Question"
    new_comment.post_id = params[:id]
    new_comment.save

    @errors = new_comment.errors.full_messages

    erb :'questions/newComment' if @errors.length != 0

    redirect "/questions/#{params[:id]}"
  else
    redirect 'users/login'
  end
end

delete '/questions/:id/comments/:comment_id' do
  @comment = Comment.find_by(id: params[:comment_id])
  if logged_in? && current_user == @comment.user
    @comment.destroy
    redirect "/questions/#{params[:id]}"
  else
    redirect 'users/login'
  end
end
