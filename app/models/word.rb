class Word < ActiveRecord::Base
  attr_accessible :index, :word
  validates_uniqueness_of :word

    def saveFromCSV(filepath)
        #clear db table so only one file is loaded at once
        Word.delete_all
        require 'csv'
        CSV.foreach(filepath, headers: true) do | row|
            index = row[0].split('').sort.join
            word = Word.new({:index => index, :word => row[0].to_s.strip}).save;
        end

    end

end
