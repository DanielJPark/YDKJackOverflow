get '/answers/:id/comments/new' do
  @answer = Answer.find(params[:id])
  @question = @answer.question
  @comments = @answer.comments
  @post_id = params[:id]
  @post_type = "answers"
  erb :'answers/newComment'
end