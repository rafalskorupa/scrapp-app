class Page < ApplicationRecord
  has_many :page_data
  validates :url,
            presence: true,
            uniqueness: true,
            format: { with: /https:\/\/www.saxoprint.co.uk\/shop\/[a-z-]+/ }


  def self.sanitize(url)

    raise ArgumentError unless url.instance_of?(String)

    if (url.include? 'saxoprint.co.uk/shop/')
      resource = url.split('/').last
      url = "https://www.saxoprint.co.uk/shop/#{resource}"
    end

    url
  end

end
