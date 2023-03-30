require 'rails_helper'

RSpec.describe User do 
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do 
    it { should have_many :favorites }
    it { should have_many :reviews }
  end
end