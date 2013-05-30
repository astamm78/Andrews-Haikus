get '/signin' do
  erb :signin
end

post '/verify' do
  @login_auth = User.authenticate(params[:email], params[:password])
  if @login_auth == true
    session[:user_id] = User.find_by_email(params[:email]).id
    @haikus = User.find(current_user.id).haikus.paginate(:page => params[:page]).order('created_at DESC')
    @title = "Haikus liked by #{User.find(current_user.id).full_name}"
    erb :all
  else
    @errors = "Please log in with a valid email and password"
    erb :signin
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect to '/'
end

get '/signup' do
  if @login_auth == true
    redirect to '/'
  else
    erb :signup
  end
end

post '/create_account' do
  if params[:password] == params[:password_verify]
    @new_user = User.create(  :full_name  => params[:full_name],
                              :email      => params[:email],
                              :password   => params[:password])
    if @new_user.save
      session[:user_id] = @new_user.id
      @haiku = Haiku.find((1..Haiku.count).to_a.sample)
      erb :haiku, :locals => {:haiku => @haiku}
    else
      @errors = "Full Name, a valid email and a password<br>of at least 5 characters are required"
      erb :signup
    end
  else
    @errors = "Your passwords do not match.<br>Full Name, a valid email and a password<br>of at least 5 characters are required."
    erb :signup
  end
end

get '/user/:id' do
  @haikus = User.find(params[:id]).haikus.paginate(:page => params[:page]).order('created_at DESC')
  @title = "Haikus liked by #{User.find(params[:id]).full_name}"
  erb :all
end