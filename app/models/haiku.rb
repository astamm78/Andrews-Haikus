class Haiku < ActiveRecord::Base

  has_many :tags
  belongs_to :user

  validates :line_1, :presence => true
  validates :line_2, :presence => true
  validates :line_3, :presence => true

  self.per_page = 3

end
