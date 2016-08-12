post '/questions/:qid/answers' do
  if !logged_in?
    redirect '/users/login'
  end
  @answer = Answer.create(params[:answer])

  redirect "/questions/#{ params[:qid] }"
end

get '/answers/:id/comments/new' do
  @answer = Answer.find(params[:id])
  @question = @answer.question
  @comments = @answer.comments
  @post_id = params[:id]
  @post_type = "answers"
  erb :'answers/newComment'
end

post '/answers/:id/upvote' do
  if logged_in?
    answer = Answer.find(params[:id])
    Vote.create(value: 1, post: answer, user: current_user)
    redirect "/questions/#{answer.question.id}"
  else
    redirect 'users/login'
  end
end

post '/answers/:id/downvote' do
  if logged_in?
    answer = Answer.find(params[:id])
    Vote.create(value: -1, post: answer, user: current_user)
    redirect "/questions/#{answer.question.id}"
  else
    redirect 'users/login'
  end
end

post '/answers/:id/comments' do
  if logged_in?
    new_comment = Comment.new(params[:comment])
    new_comment.user = current_user
    new_comment.post_type = "Answer"
    new_comment.post_id = params[:id]
    new_comment.save

    @errors = new_comment.errors.full_messages

    erb :'answers/newComment' if @errors.length != 0

    q_id = Answer.find(params[:id]).question.id

    redirect "/questions/#{q_id}"
  else
    redirect 'users/login'
  end
end


delete '/answers/:id' do
  @answer = Answer.find_by(id: params[:id])
  if logged_in? && current_user == @answer.user
    question_id = @answer.question.id
    if @answer.comments.count == 0
      @answer.destroy
    else
      @answer.user = User.find_or_create_by(username: "Anonymous", email: "anonymous@anonymous.com", hashed_password: "password")
      @answer.save
    end
    redirect "/questions/#{question_id}"
  else
    redirect 'users/login'
  end
end
