class ScrapperController < ApplicationController
  def index
  end

  def create
    url = Page.sanitize(params["/"][:url])
    @page = Page.find_or_initialize_by(url: url)
    @errors = @page.errors unless @page.save

  end

  def destroy
    @page = 'page' + params[:id]
    p @page
  end
end
