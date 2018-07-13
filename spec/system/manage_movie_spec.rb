require 'rails_helper'

RSpec.describe 'Create a new movie', type: :system do
  scenario 'with a valid name and a valid description' do
    create_movie_with 'Gone with the wind', 'A love drama with Scarlet O Hara'

    expect(page).to have_content('Gone with the wind')
  end

  def create_movie_with(name, description)
    visit new_movie_path
    fill_in 'Name', with: name
    fill_in 'Description', with: description
    click_button 'Create'
  end
end

RSpec.describe 'Edit a new movie', type: :system do
  before do
    FactoryBot.create(:movie)
  end

  scenario 'with a valid name and a valid description' do
    edit_movie_with 'New name', 'Mia malakia'

    expect(page).to have_content('Mia malakia')
  end

  def edit_movie_with(name, description)
    visit edit_movie_path(id:1)
    fill_in 'Name', with: name
    fill_in 'Description', with: description
    click_button 'Submit'
  end
end

RSpec.describe 'Show a movie', type: :system do
  before do
    FactoryBot.create(:movie)
  end

  scenario 'with a valid name and a valid description' do
    show_movie(1)

    expect(page).to have_content('Deadpool')
  end

  def show_movie(id)
    visit movie_path(id)
  end
end

RSpec.describe 'Delete a movie', type: :system do
  before do
    FactoryBot.create(:movie)
  end

  scenario 'from ' do
    delete_movie(1)

    expect(page).to have_content('New Movie')
  end

  def delete_movie(id)
    visit movie_path(id)
    click_button 'Delete Movie'
  end
end
