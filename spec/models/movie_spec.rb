require 'rails_helper'

RSpec.describe Movie do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should have_many(:movie_categories) }
  it { should have_many(:ratings).dependent(:destroy) }
  it { should have_many(:categories).through(:movie_categories) }

  describe '#overall_score' do
    let(:movie) { Movie.new }
    let(:rating_1) { Rating.create(score:10) }
    let(:rating_2) { Rating.create(score:0) }

    before do
      allow(movie).to receive(:ratings).and_return([rating_1, rating_2])
    end

    it 'returns the average score' do
      expect(movie.overall_score).to eql 5.0
    end
  end
end
