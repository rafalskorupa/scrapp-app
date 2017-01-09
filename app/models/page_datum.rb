class PageDatum < ApplicationRecord
  belongs_to :page
  validates_presence_of :price_net, :price_vat, :price_gross, :title
end
