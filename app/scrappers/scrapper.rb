require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'phantomjs'

class Scrapper
  attr_reader :data

  include Capybara::DSL
  Capybara.default_driver = :poltergeist

  def initialize(url)
    time = Time.now
    Phantomjs.path

    visit url
    puts
    puts "=============== > Page rendered in #{Time.now-time} s"
    puts
    @data = HashWithIndifferentAccess.new
    default_params.each do |key,value|
      @data.store(key, find(value).text)
    end

  end


  private

  def default_params
    HashWithIndifferentAccess.new({
                                      title: 'h1',
                                      price_net: 'span#customerNetValue.priceCell',
                                      price_vat: 'span#customerVatValue.priceCell',
                                      price_gross: 'span#customerGrossValue.priceCell.finalPrice'
                                  })
  end
end