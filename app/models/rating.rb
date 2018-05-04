class Rating < ApplicationRecord
  validates :score, presence: true
  validates :movie_id, presence: true
  belongs_to :movie
end
