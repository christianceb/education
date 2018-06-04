class Professor < ApplicationRecord
  has_many :classes
  has_many :subjects, through: :classes
  validates :name, presence: true, length: { minimum: 5 }
end