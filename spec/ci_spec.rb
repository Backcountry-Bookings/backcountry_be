require 'rails_helper'

RSpec.describe 'CI' do
  it 'returns true' do
    expect(true).to eq(true)
  end

  it 'returns false' do
    expect(false).to eq(false)
  end
end