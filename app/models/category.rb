class Category < ApplicationRecord
  validates :name, presence: true

  has_many :movie_categories
  has_many :movies, through: :movie_categories
end
