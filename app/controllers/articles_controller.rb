class ArticlesController < ApplicationController
load_and_authorize_resource # initalizes all need members '@article(s)'

	def new
		@article = Article.new
	end

	def create
		@article = params[:article]
		unless Article.create(@article)
			flash[:error] = " Article could not be saved"
			render 'new'
		else
			redirect_to @article
		end

	end

	def edit
	 	@article = Article.find(params[:id])
	end

	def update
		@article = params[:article]

		Article.find(params[:id]).update_attributes(@article)

		redirect_to @article

	end

	def show
		@article = Article.find(params[:id])
	end

	def destroy
		
	end

	def index
		@articles = Article.all
		authorize! :read, Article
		# @articles = Article.all	
	end

	def summarize
		@articles = Article.all
	end

end
