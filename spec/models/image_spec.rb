require 'rails_helper'

RSpec.describe Image do 
  describe 'validations' do
    it { should have_one_attached :img_file }
  end

  describe 'relationships' do
    it { should belong_to :review }
  end
end