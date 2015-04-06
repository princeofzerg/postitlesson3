class Category < ActiveRecord::Base
	has_many :post_categories
	has_many :posts, through: :post_categories
	validates :name, presence: true
        before_save :generate_slugs

   def to_param
	self.slug
   end

   def generate_slugs
	self.slug = self.name.gsub(' ','-').downcase
  
   end



	
end
