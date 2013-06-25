class ArticlesController < ApplicationController
load_and_authorize_resource # initalizes all need members '@article(s)'

	def new
		@article = Article.new
	end

	def create
		@article = Article.create(params[:article])
		
		unless @article.save
			flash[:error] = " Article could not be saved"
			render 'new'
		else
			redirect_to articles_path
		end

	end

	def edit
	 	@article = Article.find(params[:id])
	end

	def update
		@article = params[:article]

		if Article.find(params[:id]).update_attributes(@article)
			redirect_to @article
		else
			flash[:error] = 'Article could not be saved'
			redirect_to edit_article_path @article
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	def destroy
		@article = Article.find(params[:id])
		@article.delete

		redirect_to articles_path	
	end

	def index
		@articles = Article.order('created_at DESC')
		authorize! :read, Article
		# @articles = Article.all	
	end

	def summarize
		@articles = Article.all
	end

end
