get '/questions/new' do

end

post '/questions' do

end

get '/questions/:id' do
  @question = Question.find(params[:id])
  if @question.user == User.find_by(username: "Anonymous")
    @question.title = "[This Question was deleted by user]"
    @question.content = "[This Question was deleted by user]"
  end
  @selected_answer = @question.selected_answer
  @answers = @question.answers.select { |a| a.id != @selected_answer.try(:id) }
  erb :'questions/show'
end

put '/questions/:id/edit' do

end



delete '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  if @question.answers.count == 0 && @question.comments.count == 0
    @question.destroy
    redirect '/'
  else
    @question.user = User.find_or_create_by(username: "Anonymous", email: "anonymous@anonymous.com", hashed_password: "password")
    @question.save
    redirect "/questions/#{params[:id]}"
  end
end
