get '/all' do
  @haikus = Haiku.paginate(:page => params[:page])
  erb :all
end

get '/haiku/:id' do
  @haiku = Haiku.find(params[:id])
  erb :haiku
end

get '/vote/:id' do
  Haiku.find(params[:id]).increment!(:votes)
  @haikus = Haiku.paginate(:page => params[:page])
  erb :all
end

get '/newest' do
  @haiku = Haiku.order(:created_at).reverse.first
  erb :haiku
end