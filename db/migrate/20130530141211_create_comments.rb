class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |c|
      c.string :content
    end
  end
end
