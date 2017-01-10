class Page < ApplicationRecord
  has_many :page_data
  validates :url,
            presence: true,
            uniqueness: true,
            format: { with: /https:\/\/www.saxoprint.co.uk\/shop\/[a-z-]+/ }
  after_save :update_data


  def data
    if page_data.last.created_at < 1.days.ago
      update_data
    end
    page_data.last
  end


  def self.sanitize(url)

    raise ArgumentError unless url.instance_of?(String)

    if (url.include? 'saxoprint.co.uk/shop/')
      resource = url.split('/').last
      url = "https://www.saxoprint.co.uk/shop/#{resource}"
    end

    url
  end

  def update_data
    page_data.create!(Scrapper.new(self.url).data)
  end

end
