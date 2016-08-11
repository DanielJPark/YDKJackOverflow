get '/answers/:id/comments/new' do
  @answer = Answer.find(params[:id])
  @question = @answer.question
  @comments = @answer.comments
  @post_id = params[:id]
  @post_type = "answers"
  erb :'answers/newComment'
end

post '/answers/:id/comments' do
  new_comment = Comment.new(params[:comment])
  new_comment.user = current_user
  new_comment.post_type = "Answer"
  new_comment.post_id = params[:id]
  new_comment.save

  @errors = new_comment.errors.full_messages

  erb :'answers/newComment' if @errors.length != 0

  q_id = Answer.find(params[:id]).question.id

  redirect "/questions/#{q_id}"
end


delete '/answers/:id' do
  @answer = Answer.find_by(id: params[:id])
  question_id = @answer.question.id
  if @answer.comments.count == 0
    @answer.destroy
  else
    @answer.user = User.find_or_create_by(username: "Anonymous", email: "anonymous@anonymous.com", hashed_password: "password")
    @answer.save
  end
  redirect "/questions/#{question_id}"

end
