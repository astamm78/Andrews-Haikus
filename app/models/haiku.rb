class Haiku < ActiveRecord::Base

  belongs_to :user

  validates :line_1, :presence => true
  validates :line_2, :presence => true
  validates :line_3, :presence => true

end
