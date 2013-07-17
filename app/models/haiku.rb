class Haiku < ActiveRecord::Base

  belongs_to :author, :class_name => "User", :foreign_key => "author_id"
  has_many :likes
  has_many :users, :through => :likes

  has_many :comments

  validates :line_1, :presence => true
  validates :line_2, :presence => true
  validates :line_3, :presence => true

  self.per_page = 3

  before_save :valid_haiku?

  def valid_haiku?
    count_syllables(self.line_1) == 5 && count_syllables(self.line_2) == 7 && count_syllables(self.line_3) == 5
  end

  def count_syllables(input)
    counts = input.gsub(/[\-\,\.\'\b\s]+|\\n/, " ").split(" ").map do |word|
      Dictionary.instance.dictionary[word.upcase.to_sym]
    end
    puts counts
    counts.inject(&:+)
  end

  def self.by_likes
    Haiku.all.sort!{ |a,b| a.likes.count <=> b.likes.count }.reverse!
  end

end