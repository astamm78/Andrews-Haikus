class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :haiku

  validates :line_1, :presence => true
  validates :line_2, :presence => true
  validates :line_3, :presence => true

  before_save :valid_haiku?

  def valid_haiku?
    count_syllables(self.line_1) == 5 && count_syllables(self.line_2) == 7 && count_syllables(self.line_3) == 5
  end

  def count_syllables(input)
    counts = input.gsub(/[\-\,\.\b\s]+|\\n/, " ").split(" ").map do |word|
      Dictionary.new.dictionary[word.upcase.to_sym]
    end
    counts.inject(&:+)
  end

end