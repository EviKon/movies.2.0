require 'rails_helper'

RSpec.describe "Movies", type: :request do
  describe "GET /movies" do
    it "works! (now write some real specs)" do
      get movies_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /movies/new' do
    it 'gets to the form page for a movie' do
      get new_movie_path

      expect(response).to have_http_status(200)
    end

    it 'creates a new movie' do
      post movies_path, params: { movie: { name: 'Tainia', description: 'Foveri' } }

      expect(response).to redirect_to movie_path(id: 1)
    end
  end
end
