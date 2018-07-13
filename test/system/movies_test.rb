require "application_system_test_case"

class MoviesTest < ApplicationSystemTestCase
  test "creating a movie" do
    visit root_url

    click_on 'New Movie'

    fill_in 'Name', with: "Tainia"
    fill_in 'Description', with: 'Katapliktiki tainia sou lew'

    click_on 'Create'

    assert_text 'Tainia'
  end

  test "creating a category" do
    visit root_url

    click_on 'New Category'

    fill_in 'Name', with: "Drama"

    click_on 'Create'

    assert_text 'Drama'
  end
end
