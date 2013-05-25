get '/rand' do
  @haiku = Haiku.find((1..Haiku.count).to_a.sample)
  erb :rand
end

get '/all' do
  @haikus = Haiku.paginate(:page => params[:page]).find(:all, :order => "votes DESC")
  erb :all
end

get '/haiku/:id' do
  @haiku = Haiku.find(params[:id])
  erb :haiku
end

get '/vote/:id' do
  Haiku.find(params[:id]).increment!(:votes)
  @haikus = Haiku.paginate(:page => params[:page]).find(:all, :order => "votes DESC")
  redirect '/all'
end

get '/newest' do
  @haiku = Haiku.order(:created_at).reverse.first
  erb :haiku
end