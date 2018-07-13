require 'rails_helper'

RSpec.describe RatingsController do
  describe '#create' do
    let(:movie) { Movie.create(name: 'No name movie', description: 'Nothing to commit') }
    let(:rating) { Rating.find_by(score: 10) }
    let(:path) { movie_path(movie) }

    it 'creates an entry in the database' do
      post :create, params: { movie_id: movie.id, rating: { score: 10 } }

      expect(response).to redirect_to(path)
    end

    context 'when the rating is not saved' do

      it 'redirects back' do
        post :create, params: { movie_id: movie.id, rating: { score: nil } }

        expect(response).to redirect_to(path)
      end
    end
  end
end
