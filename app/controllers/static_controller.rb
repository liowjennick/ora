class StaticController < ApplicationController
	def homepage
		@offers = Offer.all.order("created_at DESC")#.page(params[:page])	
		@users = User.all.order("created_at DESC").limit(5)
	end
end
