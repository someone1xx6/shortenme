

class UrlsController < ApplicationController 
  before_action :find_url, only: [:show, :shortened]

  def index
  end

  def show
  	if(params[:short_url][-1]=='+') then
  		#ahoy.track_visit
  		render "shortened"
  	else
	  	@u = ENV["BASE_URL"]+@url.original_url
	  	ahoy.track_visit
		  redirect_to @u
	end
  end

  def create
  	@url = Url.new(params.require(:shorten).permit(:original_url))
  	@url.save

	   redirect_to "https://#{ENV["BASE_URL"]}#{@url.short_url}+"
  end

  def find_url
  	short_url = params[:short_url]
  	@url = Url.find_by_short_url(short_url.delete "+")
  	@qr = RQRCode::QRCode.new( ENV["BASE_URL"]+@url.short_url, :size => 5, :level => :h )
  end

end
