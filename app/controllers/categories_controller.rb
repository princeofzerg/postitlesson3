class CategoriesController < ApplicationController
   
def index
  @categories = Category.all

end

def create
  @category = Category.new(category_params)
  if @category.save
     redirect_to categories_path
  else
      render "new"
  end

end


def edit
    @category = Category.find_by slug: params[:id]
end

def show
    @category = Category.find_by slug: params[:id]
 
    case params[:sort]
       
        when "newest"
         @categories = @category.posts.order('created_at DESC').all       
	else
           @categories = @category.posts     
        end       
      respond_to do |format|
            format.html do
              @categories

            end
               format.js

          end
end

def new
    @category = Category.new

end
def update
     @category = Category.find_by slug: params[:id]
   if @category.update(category_params)
	flash[:notice] = "This post is updated "
	redirect_to category_path(@category)
   else
	render "edit"
   end

end	

private
 def category_params
    params.require(:category).permit(:name)

 end


end
