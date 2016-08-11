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
	@question = Question.new(params[:question])
	if @question.save
		redirect "/questions/#{@question.id}"
	else
		@errors = @question.errors.full_messages
		erb :'/questions/new'
	end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @selected_answer = @question.selected_answer
  @answers = @question.answers.select { |a| a.id != @selected_answer.id }
  erb :'/questions/show'
end

put '/questions/:id/edit' do

end

post '/questions/:id/vote' do
  question = Question.find(params[:id])
  Vote.create(value: 1, post: question, user: current_user)
  redirect "/questions/#{params[:id]}"
end

get '/questions/:id/comments/new' do
  @question = Question.find(params[:id])
  @comments = @question.comments
  @post_id = params[:id]
  @post_type = "questions"
  erb :'questions/newComment'
end

post '/questions/:id/comments' do
  new_comment = Comment.new(params[:comment])
  new_comment.user = current_user
  new_comment.post_type = "Question"
  new_comment.post_id = params[:id]
  new_comment.save

  @errors = new_comment.errors.full_messages

  erb :'questions/newComment' if @errors.length != 0

  redirect "/questions/#{params[:id]}"
end
