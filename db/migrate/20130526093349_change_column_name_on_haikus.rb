class ChangeColumnNameOnHaikus < ActiveRecord::Migration
  def change
    rename_column :haikus, :user_id, :author_id
  end
end
