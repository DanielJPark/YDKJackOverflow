get '/categories/:qid/questions/new' do
	if logged_in?
		@category = Category.find(params[:qid])
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
