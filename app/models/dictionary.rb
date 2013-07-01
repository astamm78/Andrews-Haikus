require 'csv'

class Dictionary

  attr_reader :dictionary, :file

  def initialize
    @file = "#{APP_ROOT}/config/dictionary.csv"
    @dictionary = {}
    open_file
  end

  def open_file
   CSV.open(file).read.map do |row|
      dictionary[row[0].to_sym] = row[1].to_s.scan(/(\d)/).size
    end
  end

end