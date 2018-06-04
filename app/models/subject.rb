class Subject < ApplicationRecord
  has_many :classes
  has_many :professors, through: :classes
  validates :title, presence: true, length: { minimum: 3 }
end