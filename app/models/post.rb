class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :post_categories
	has_many :categories, through: :post_categories
  	
	validates :url, presence: true
 	
  include Voteable_Loc5
	include Sluggable_Loc

  sluggable_column :title


     

    
   
end
