class ShortUrlsController < ApplicationController

  def show
    @short_url = ShortUrl.find(params[:id])
    render file: 'public/404.html', status: :not_found, layout: false and return if @short_url.expiry?

    @short_url.update(count: @short_url.count + 1)
    redirect_to @short_url.full
  end

  def index
    @short_urls = ShortUrl.all
  end

  def create
    @short_url = ShortUrl.new(short_url_params)

    respond_to do |format|
      if @short_url.save
        @short_urls = ShortUrl.all
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @short_url.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  private

  def short_url_params
    params.require(:short_url).permit(:full, :short)
  end
end
