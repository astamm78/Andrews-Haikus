class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |a|
      a.string :full_name
      a.string :email
      a.string :password
    end
  end
end
