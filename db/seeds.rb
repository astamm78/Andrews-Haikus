require 'csv'

User.create(  :full_name  => "Andrew Stamm",
              :email      => "andrewstamm@me.com",
              :password   => "password")

CSV.read('db/haiku.csv').each do |haiku|
  Haiku.create( :line_1 => haiku[0],
                :line_2 => haiku[1],
                :line_3 => haiku[2],
                :user_id => 1)
end