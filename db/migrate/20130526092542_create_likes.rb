class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |l|
      l.integer :user_id
      l.integer :haiku_id
    end
  end
end
