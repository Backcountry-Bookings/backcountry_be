require 'rails_helper'

RSpec.describe Favorite do 
  describe 'validations' do 
    it { should validate_presence_of :campsite_name }
    it { should validate_presence_of :campsite_id }
    it { should validate_presence_of :campsite_details }
    it { should validate_presence_of :image }
  end

  describe 'relationships' do
    it { should belong_to :user }
  end
end