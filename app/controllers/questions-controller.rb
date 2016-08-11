get '/questions/new' do

end

post '/questions' do

end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @selected_answer = @question.selected_answer
  @answers = @question.answers #.delete(@selected_answer)
  p @answers
  erb :'questions/show'
end

put '/questions/:id/edit' do

end
