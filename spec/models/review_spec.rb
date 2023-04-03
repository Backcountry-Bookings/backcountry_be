require 'rails_helper'
require 'active_storage_validations/matchers'

RSpec.configure do |config|
  config.include ActiveStorageValidations::Matchers
end

RSpec.describe Review do 
  describe 'validations' do 
    it { should validate_presence_of :campsite_id }
    it { is_expected.to validate_attached_of(:img_file) }
    it { is_expected.to validate_content_type_of(:img_file).allowing('image/png', 'image/jpg', 'image/jpeg') }
    it { is_expected.to validate_content_type_of(:img_file).rejecting('text/plain', 'text/xml', 'image/gif',) }
    it { is_expected.to validate_size_of(:img_file).between(1.kilobytes..5.megabytes) }
  end
  describe 'relationships' do
    it { should belong_to :user }
  end
end