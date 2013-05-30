get '/' do
  @haiku = Haiku.all.sample
  erb :haiku, :locals => {:haiku => @haiku}
end