class Comment < ActiveRecord::Base
	 include Voteable_Loc2
	belongs_to :user
	belongs_to :post
	validates :body, presence: true
	

 
 
   
   
end
