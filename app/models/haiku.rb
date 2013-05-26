class Haiku < ActiveRecord::Base

  belongs_to :author, :class_name => "User", :foreign_key => "author_id"
  has_many :likes
  has_many :users, :through => :likes

  validates :line_1, :presence => true
  validates :line_2, :presence => true
  validates :line_3, :presence => true

  self.per_page = 3

end