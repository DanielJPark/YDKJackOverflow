get '/categories' do
  @categories = Category.all.order(:title)
  erb :'categories/index'
end

get '/categories/:id' do
	@category = Category.find(params[:id])
  @questions = @category.questions.order(:updated_at)
  erb :'categories/show'
end
