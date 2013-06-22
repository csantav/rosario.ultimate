class HomeController < ApplicationController
	
	def index
		# get the first 3 artivles
		@articles = Article.order('created_at DESC').limit(3)	
	end
end
