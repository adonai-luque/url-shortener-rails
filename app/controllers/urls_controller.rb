class UrlsController < ApplicationController
  def index
    @url = Url.new
    @urls = Url.all
  end

  def create
    @url = Url.new(url_params)
    @url.save
    @url.short = @url.id.to_s(36)
    @url.clicks = 0
    @url.save
    redirect_to '/'
  end

  def show
    @url = Url.find(params[:short].to_i(36))
    @url.clicks += 1
    @url.save
    redirect_to @url.full
  end

  private
  def url_params
    params.require(:url).permit(:full)
  end
end
