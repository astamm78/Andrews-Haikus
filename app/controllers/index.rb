get '/' do
  @haiku = Haiku.find((1..Haiku.count).to_a.sample)
  erb :haiku
end