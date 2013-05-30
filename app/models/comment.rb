class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :haiku

  validates :line_1, :presence => true
  validates :line_2, :presence => true
  validates :line_3, :presence => true

end
