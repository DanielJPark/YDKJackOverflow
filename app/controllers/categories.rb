get '/categories' do
  @categories = Category.all.order(:title)
  erb :categories
end
