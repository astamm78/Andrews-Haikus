get '/' do
  @haiku = Haiku.find((1..Haiku.count).to_a.sample)
  erb :haiku
end

get '/narwhal' do
  erb :signin
end

post '/verify' do
  @login_auth = User.authenticate(params[:email], params[:password])
  if @login_auth == true
    session[:user_id] = User.find_by_email(params[:email]).id
    redirect to "/create"
  else
    @errors = "Please log in with a valid email and password"
    erb :signin
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect to '/'
end

get '/rand' do
  @haiku = Haiku.find((1..Haiku.count).to_a.sample)
  erb :rand
end

get '/platypus' do
  if @login_auth == true
    redirect to '/rand'
  else
    erb :signup
  end
end

post '/create_account' do
  @new_user = User.create(  :full_name  => params[:full_name],
                            :email      => params[:email],
                            :password   => params[:password])
  if @new_user.save
    session[:user_id] = @new_user.id
    redirect to "/author/#{@new_user.id}"
  else
    @errors = "Full Name, a valid email and a password<br>of at least 5 characters are required"
    erb :signup
  end
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
  redirect to '/all'
end

get '/newest' do
  @haiku = Haiku.order(:created_at).reverse.first
  erb :haiku
end

get '/create' do
  if current_user == nil
    redirect '/signin'
  else
    erb :create
  end
end

post '/create_haiku' do
  @new_haiku = Haiku.create(  :line_1   => params[:line_1],
                              :line_2   => params[:line_2],
                              :line_3   => params[:line_3],
                              :user_id  => current_user.id )
  if @new_haiku.save
    redirect to "/haiku/#{@new_haiku.id}"
  else
    @errors = "You must enter in all three lines."
    erb :create
  end
end
