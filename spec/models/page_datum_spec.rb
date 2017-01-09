require 'rails_helper'

RSpec.describe PageDatum, type: :model do

  describe 'record validations' do

    it { should belong_to :page }

    it { should validate_presence_of :title}
    it { should validate_presence_of :price_net }
    it { should validate_presence_of :price_vat }
    it { should validate_presence_of :price_gross }

  end

  describe 'factory' do
    [:old_record, :new_record].each do |factory|
      it "#{factory} is valid" do
        expect(build(factory)).to be_valid
      end
    end
  end
end
