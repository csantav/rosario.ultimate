class PageController < ApplicationController
	def index
		@pages = Page.all
	end

	def about_us
		getContent('about us')
	end

	def find_us
		getContent('find us')
	end

	def training
		getContent('training')
	end

	def getContent(name)
		@page = Page.find_by_name(name)	
	end
end
