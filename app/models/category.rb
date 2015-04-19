class Category < ActiveRecord::Base
	has_many :post_categories
	has_many :posts, through: :post_categories
	validates :name, presence: true


  include Sluggable_Loc

  sluggable_column :name
   
   


	
end
