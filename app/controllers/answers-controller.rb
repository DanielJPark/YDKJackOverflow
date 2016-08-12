post '/questions/:qid/answers' do
  @answer = Answer.new(params[answer])
  if @answer.save
    @question = Question.find(params[:qid])
    @question.answers << @answer
  end

end

get '/answers/:id/comments/new' do
  @answer = Answer.find(params[:id])
  @question = @answer.question
  @comments = @answer.comments
  @post_id = params[:id]
  @post_type = "answers"
  erb :'answers/newComment'
end

post '/answers/:id/vote' do
  answer = Answer.find(params[:id])
  Vote.create(value: 1, post: answer, user: current_user)
  redirect "/answers/#{params[:id]}"
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