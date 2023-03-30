require 'rails_helper'

RSpec.describe Review do 
  describe 'validations' do 
    it { should validate_presence_of :campsite_id }
  end

  describe 'relationships' do
    it { should belong_to :user }
  end
end