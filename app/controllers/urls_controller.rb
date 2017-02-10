class UrlsController < ApplicationController 
  before_action :find_url, only: [:show, :shortened]
  before_action :sanitize, only: [:create]

  def index
  end

  def show
  	if(params[:short_url][-1]=='+') then
  		#ahoy.track_visit
  		render "shortened"
  	else
	  	@u = "http://#{@url.original_url}"
	  	ahoy.track_visit
		  redirect_to @u
	end
  end

  def create
  	@url = Url.new(:original_url => @sanitized_url)
  	@url.save
	  redirect_to "http://#{ENV["BASE_URL"]}#{@url.short_url}+"
  end

  def find_url
  	short_url = params[:short_url]
  	@url = Url.find_by_short_url(short_url.delete "+")
  	@qr = RQRCode::QRCode.new( ENV["BASE_URL"]+@url.short_url, :size => 5, :level => :h )
  end

  def sanitize
    original_url = params[:shorten][:original_url]
    original_url.strip!
    @sanitized_url = original_url.downcase.gsub(/(https?:\/\/)|(www\.)/, "")
    @sanitized_url.slice!(-1) if @sanitized_url[-1] == "/"
  end

end
