require 'rails_helper'

RSpec.describe MoviesController do
  let(:movie) { Movie.create(name: 'it', description: 'Horror Movie')}

  describe '#index' do
    it 'renders the index page' do
      get :index

      expect(response).to render_template :index
    end
  end

  describe '#show' do
    it 'renders the show page' do
      get :show, params: { id: movie.id }

      expect(response).to render_template :show
    end
  end

  describe '#new' do
    it 'renders the new page' do
      get :new

      expect(response).to render_template :new
    end
  end

  describe '#create' do
    let(:movie) { Movie.find_by(name: 'it') }

    it 'creates an entry in the database' do
      post :create, params: { movie: { name: 'it', description: 'Horror movie' } }

      expect(response).to redirect_to(movie_path(movie))
    end
  end

  describe '#edit' do
    it 'renders the edit page' do
      get :edit, params: { id: movie.id }

      expect(response).to render_template :edit
    end
  end

  describe '#update' do
    it 'renders the movie with the new name' do
      patch :update, params: { id: movie.id, movie: { name: 'Carrie' } }

      expect(response).to redirect_to(movie_path(movie))
    end
  end

  describe '#destroy' do
    it 'redirects to the all movies path' do
      delete :destroy, params: { id: movie.id }

      expect(response).to redirect_to(root_path)
    end
  end
end
