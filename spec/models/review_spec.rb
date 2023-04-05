require 'rails_helper'

RSpec.describe Review do 
  before :each do 
    WebMock.allow_net_connect!
  end

  describe 'validations' do 
    it { should validate_presence_of :campsite_id }
    it { is_expected.to validate_content_type_of(:img_file).allowing('image/png', 'image/jpeg') }
    it { is_expected.to validate_content_type_of(:img_file).rejecting('text/plain', 'text/xml', 'image/gif',) }
    it { is_expected.to validate_size_of(:img_file).between(1.kilobytes..5.megabytes) }
  end

  describe 'relationships' do
    it { should belong_to :user }
  end
end