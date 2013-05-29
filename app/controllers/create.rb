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
                              :author_id  => current_user.id )
  if @new_haiku.save
    redirect to "/haiku/#{@new_haiku.id}"
  else
    @errors = "You must enter in all three lines."
    erb :create
  end
end