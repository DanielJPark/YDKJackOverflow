get '/categories' do
  @categories = Category.all.order(:title)
  erb :'categories/index'
end

get '/categories/:id' do
  @questions = Category.find(params[:id]).questions.order(:updated_at)
  erb :'categories/show'
end
