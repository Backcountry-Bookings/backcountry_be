require 'rails_helper'

RSpec.describe "CI test", type: :request do
  it "should pass" do
    expect(true).to be false
  end
end