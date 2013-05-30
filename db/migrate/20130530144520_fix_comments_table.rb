class FixCommentsTable < ActiveRecord::Migration
  def change
    rename_column :comments, :content, :line_1
    add_column :comments, :line_2, :string
    add_column :comments, :line_3, :string
  end
end
