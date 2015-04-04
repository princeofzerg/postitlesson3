class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post
	validates :body, presence: true
	has_many :votes, as: :voteable

   def total_votes
    up_votes - down_votes
   end
    
   def up_votes
     self.votes.where(vote: true).size
 
   end
   def down_votes
      self.votes.where(vote: false).size
   
   end 
 
end
