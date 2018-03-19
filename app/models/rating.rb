class Rating < ApplicationRecord
  validates :score, presence: true
  validates :movie_id, presence: true
  belongs_to :movie

  def overall_score(movie_id)
    overall_score = 0
    @ratings = Movie.find(movie_id.id).ratings
    @ratings.each do |rating|
      if movie == movie_id
        overall_score += rating.score
      end
    end
    overall_score
  end
end
