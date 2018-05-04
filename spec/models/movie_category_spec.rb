require 'rails_helper'

RSpec.describe MovieCategory do
  it { should belong_to(:movie) }
  it { should belong_to(:category) }
end
