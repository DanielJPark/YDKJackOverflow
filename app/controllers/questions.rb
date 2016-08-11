get '/categories/:qid/questions/new' do
	if logged_in?
		@category = Category.find(params[:qid])
		erb :'questions/new'
	else 
		redirect 'users/login'
	end
end

get '/questions/new' do
	if logged_in?
		erb :'questions/new'
	else 
		redirect 'users/login'
	end
end

post '/questions' do

end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @selected_answer = @question.selected_answer
  @answers = @question.answers.select { |a| a.id != @selected_answer.id }
  erb :'questions/show'
end

put '/questions/:id/edit' do

end
