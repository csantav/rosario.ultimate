class Article < ActiveRecord::Base
	validates :title, presence: true
	belongs_to :user
	attr_accessible :content, :title, :user_id

end
