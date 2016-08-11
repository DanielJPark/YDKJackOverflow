get '/questions/new' do

end

post '/questions' do

end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @selected_answer = @question.selected_answer
  @answers = @question.answers.select { |a| a.id != @selected_answer.try(:id) }
  erb :'questions/show'
end

put '/questions/:id/edit' do

end

post '/answers/:id/vote' do
  answer = Answer.find(params[:id])
  Vote.create(value: )
end
