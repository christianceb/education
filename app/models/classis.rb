=begin
  Because we can't use 'Class' as it is a reserved word by Ruby (on Rails), we will use the origin
  of the word instead. The etymology of 'Class' is from the latin word 'Classis' :)
=end
class Classis < ApplicationRecord
  belongs_to :subject
  belongs_to :professor
  has_many :comments, dependent: :destroy
  
  validates :subject, presence: true
  validates :professor, presence: true
end