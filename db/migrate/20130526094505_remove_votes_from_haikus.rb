class RemoveVotesFromHaikus < ActiveRecord::Migration
  def change
    remove_column :haikus, :votes
  end
end
