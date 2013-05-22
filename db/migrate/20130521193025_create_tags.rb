class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :content
      t.integer :haiku_id
    end
  end
end
