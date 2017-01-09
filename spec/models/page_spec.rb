require 'rails_helper'

RSpec.describe Page, type: :model do

  describe 'model validations' do
    it { should validate_presence_of :url }
    it { should validate_uniqueness_of :url }
  end

  describe 'factory' do
    [:books_hardcover].each do |factory|
      it "#{factory.to_s} is valid" do
        expect(build(factory)).to be_valid
      end
    end

  end
end
