class PageController < ApplicationController
	def index
		@pages = Page.all
	end

	def about_us
		@page = getContent('about us')
	end

	def find_us
		@page = getContent('find us')
	end

	def training
		@page = getContent('training')
	end

	def getContent(name)
		@page = Page.find_by_name(name)	
	end

	def show
		
	end

	def edit
		@page = Page.find(params[:id])	
	end

	def update
		@page = Page.find(params[:id])
		unless @page.update_attributes(params[:page])
			@page.error = 'Page could not be saved'
			redirect_to edit_page_path(@page)
		else
			render 'show'	
		end
	end

	def destroy
		
	end

	def create	
	end
end
