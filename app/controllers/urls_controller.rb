class UrlsController < ApplicationController
  def index
    @url = Url.new
    @urls = Url.all
  end

  def create
    @url = Url.new(url_params)
    @url.save
    @url.short = @url.id.to_s(36)
    @url.save
    redirect_to urls_path
  end

  def show
    @url = Url.find(params[:id].to_i(36))
    redirect_to "http://#{@url.full}"
  end

  private
  def url_params
    params.require(:url).permit(:full)
  end
end
