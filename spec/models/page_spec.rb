require 'rails_helper'

RSpec.describe Page, type: :model do

  [:books_hardcover, :desk_calendars, :flyers].each do |factory|
    let(factory){ create(factory)}
  end

  let(:old_record){ create(:old_record, { page: books_hardcover } ) }
  let(:new_record){ create(:new_record, { page: books_hardcover } ) }





  INVALID_URLS = ['www.google.pl', 'www.colour.me', 'jenkyyylss']

  describe 'record validations' do
    it { should validate_presence_of :url }

    it { should validate_uniqueness_of :url }

    it { should have_many :page_data }

    describe 'accepts only  https://www.saxoprint.co.uk/shop/* urls' do
      it do
        should allow_values(
                   'https://www.saxoprint.co.uk/shop/books',
                   'https://www.saxoprint.co.uk/shop/desks').
                                                                for(:url)
      end

      context 'and rejects the invalids' do
        INVALID_URLS.each do |url|
          it { should_not allow_value(url).for(:url)}
        end

      end
    end

  end

  describe 'class method' do
    describe '#sanitize' do
      context 'with url not from saxoprint' do

        INVALID_URLS.each do |url|

          it "#{url} return unchanged url" do
            expect(Page.sanitize(url)).to eq url
          end

        end
      end

      context 'with url from saxoprint' do
        ['https://www.saxoprint.co.uk/shop/books-hardcover', 'www.saxoprint.co.uk/shop/books-hardcover'].each do |url|

          it "#{url} return proper url" do
            expect(Page.sanitize(url)).to eq 'https://www.saxoprint.co.uk/shop/books-hardcover'
          end

        end

      end
    end





  end

  describe 'page data' do
    before {
      [books_hardcover,old_record]
    }

    it 'have 1 pagedatas' do
      expect(books_hardcover.page_data.count).to eq 1
    end

  end

  describe 'factory' do
    [:books_hardcover, :desk_calendars, :flyers].each do |factory|
      it "#{factory.to_s} is valid" do
        expect(build(factory)).to be_valid
      end
    end

  end
end
