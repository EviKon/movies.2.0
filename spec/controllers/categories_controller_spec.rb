require 'rails_helper'

RSpec.describe CategoriesController do
  describe '#index' do
    it 'renders the index page' do
      get :index

      expect(response).to render_template :index
    end
  end

  describe '#show' do
    let(:category) { Category.create(name: 'Drama') }

    it 'renders the show page' do
      get :show, params: { id: category.id }

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
    let(:category) { Category.find_by(name: 'Comedy') }

    it 'creates an entry in the database' do
      post :create, params: { category: { name: 'Comedy' } }

      expect(response).to redirect_to(category_path(category))
    end
  end

  describe '#edit' do
    let(:category) { Category.create(name: 'Sci-Fi')}

    it 'renders the edit page' do
      get :edit, params: { id: category.id }

      expect(response).to render_template :edit
    end
  end

  describe '#update' do
    let(:category) { Category.create(name: 'Comedy') }

    it 'renders the category with the new name' do
      patch :update, params: { id: category.id, category: { name: 'Romance' } }

      expect(response).to redirect_to(category_path(category))
    end
  end

  describe '#destroy' do
    let(:category) { Category.create(name: 'Triller') }

    it 'redirects to the all categories path' do
      delete :destroy, params: { id: category.id }

      expect(response).to redirect_to(categories_path)
    end
  end
end
