require 'open-uri'
class PagesController < ApplicationController
	def index
		if @current_user.present?
			redirect_to feed_path
		end
	end

	# def search
 #  	if params[:query].present?
 #  		@query = params[:query]
 #  	else
 #  		"No result matches your search"
 #  	end

 #  	doc = Nokogiri::HTML(open("http://www.mashable.com/search/?q=#{@query}"))
 #  	images = doc.css('p')
 #  	@urls = p.map {|i| i.get_attribute('src')}
 #  end

	def auth
	end
end