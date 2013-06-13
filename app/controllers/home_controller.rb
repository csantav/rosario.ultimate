class HomeController < ApplicationController
	
	def index
		# get the first 3 artivles
		@articles = Article.all	
	end
end
