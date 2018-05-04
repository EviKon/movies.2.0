require 'rails_helper'

RSpec.describe Category do
  it { should validate_presence_of(:name) }
  it { should have_many(:movie_categories) }
  it { should have_many(:movies).through(:movie_categories) }
end
