class CreateHaikus < ActiveRecord::Migration
  def change
    create_table :haikus do |h|
      h.string :line_1, :line_2, :line_3
      h.integer :user_id
      h.integer :votes, :default => 0
      h.timestamps
    end
  end
end
