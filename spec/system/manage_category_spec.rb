require 'rails_helper'

RSpec.describe 'Create a new category', type: :system do
  scenario 'with a valid name' do
    create_category_with 'Drama'

    expect(page).to have_content('Drama')
  end

  def create_category_with(name)
    visit new_category_path
    fill_in 'Name', with: name

    click_button 'Create'
  end
end

RSpec.describe 'Edit a category', type: :system do
  before do
    FactoryBot.create(:category)
  end

  scenario 'with a valid name' do
    edit_category_with 'Omorfia'

    expect(page).to have_content('Omorfia')
  end

  def edit_category_with(name)
    visit edit_category_path(id:1)
    fill_in 'Name', with: name

    click_button 'Submit'
  end
end

RSpec.describe 'Show a category', type: :system do
  before do
    FactoryBot.create(:category)
  end

  scenario 'with a valid name and a valid description' do
    show_category(1)

    expect(page).to have_content('Sci-Fi')
  end

  def show_category(id)
    visit category_path(id)
  end
end
