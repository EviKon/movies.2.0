require 'rails_helper'

RSpec.describe Rating do
  it { should validate_presence_of(:score) }
  it { should validate_presence_of(:movie_id) }
  it { should belong_to(:movie) }
end
