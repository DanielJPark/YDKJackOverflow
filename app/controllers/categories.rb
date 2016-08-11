get '/categories' do
  @categories = Category.all.order(:title)
  erb :'categories/index'
end

get '/categories/:id'
  @questions = Category.find(:id).questions.order(:updated_at)
  erb :'categories/show'
end
