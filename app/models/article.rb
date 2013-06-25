class Article < ActiveRecord::Base
	validates :title, :content, presence: true
	belongs_to :user
	attr_accessible :content, :title, :user_id, :showOnHomepage


	def self.lastThree
		Article.where(showOnHomepage: true).order('created_at DESC').limit(3)
	end
end
