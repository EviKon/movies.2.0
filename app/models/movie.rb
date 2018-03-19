class Movie < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  has_many :movie_categories
  has_many :categories, through: :movie_categories
  has_many :ratings, dependent: :destroy

  def overall_score
    ratings.sum(:score)/ratings.size.to_f
  end
end
