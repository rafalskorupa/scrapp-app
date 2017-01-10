class ScrapperController < ApplicationController
  def index
    @scrapper = true
  end

  def create
    url = Page.sanitize(params["/"][:url])
    @page = Page.find_or_create_by!(url: url)


    if @page.valid?
      @errors = ["#{@page.slug} can be accessed by at least #{@page.access_level} users"] unless can_access(@page)
    else
      @errors = @page.errors
    end

  end

  def destroy
    @page = 'page' + params[:id]
    p @page
  end

  def can_access(page)
    return true if page.access == 0
    return false unless current_user
    page.access <= current_user.level_before_type_cast
  end
end
