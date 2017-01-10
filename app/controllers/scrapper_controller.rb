class ScrapperController < ApplicationController
  def index
  end

  def create
    url = Page.sanitize(params["/"][:url])
    @page = Page.find_or_create_by!(url: url)
  end
end
