class Comment < ActiveRecord::Base
	
	include Voteable_Loc5
	belongs_to :user
	belongs_to :post
	validates :body, presence: true  
   
end
