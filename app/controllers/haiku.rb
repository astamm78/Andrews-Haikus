get '/all' do
  @haikus = Haiku.paginate(:page => params[:page])
  @title ="All Haikus"
  erb :all
end

get '/haiku/:id' do
  @haiku = Haiku.find(params[:id])
  erb :haiku
end

get '/like/:id' do
  if Like.where(:haiku_id => params[:id], :user_id => current_user.id).length == 0
    Like.create(:user_id => current_user.id, :haiku_id => params[:id])
  end
  redirect "/user/#{current_user.id}"
end

get '/newest' do
  @haiku = Haiku.order(:created_at).reverse.first
  erb :haiku
end



Haiku.all(:select => "Haiku.*, COUNT(#{Like.haiku_id}.id) number_of_likes",
         :joins => :likes,
         :order => "number_of_likes")