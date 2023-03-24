require 'rails_helper'

RSpec.describe "CI test", type: :request do
  it "should not pass" do
    expect(true).to be true
  end
end