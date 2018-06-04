class Subject < ApplicationRecord
  has_many :classes, dependent: :destroy
  has_many :professors, through: :classes
  
  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }
end