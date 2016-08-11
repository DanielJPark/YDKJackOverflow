get '/questions/new' do

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

get '/questions/:id/comments/new' do
  @question = Question.find(params[:id])
  @comments = @question.comments
  @post_id = params[:id]
  @post_type = "questions"
  erb :'questions/newComment'
end

post '/questions/:id/comments' do
  p "arrived"
  new_comment = Comment.new(params[:comment])
  new_comment.user = current_user
  new_comment.post_type = "Question"
  new_comment.post_id = params[:id]
  new_comment.save

  @errors = new_comment.errors.full_messages

  erb :'questions/newComment' if @errors.length != 0

  redirect "/questions/#{params[:id]}"
end
