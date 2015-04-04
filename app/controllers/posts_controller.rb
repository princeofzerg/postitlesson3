class PostsController < ApplicationController
		before_action :set_post , only: [:edit,:show,:update]
                before_action :require_user, except: [:show, :index] 
		
  def index
  	@first_variable = 'Hi, i am a first variable'
  	@posts = Post.all
  end
  def show
        @comment = @post.comments.new
  	@show_variable = 'Hi i am a show_variable'
  	
  end
 
  
  def create
         @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      flash[:notice] = "Your post was created."
      redirect_to posts_path
    else
      render :new
    end
   end
     	
   def vote
   
      @post = Post.find(params[:id])
          
     @vote = Vote.create(voteable: @post, user: current_user, vote: params[:vote])
     respond_to do |format|
        format.html do
          if @vote.valid?
             flash[:notice] = 'Your vote was counted'
          else
             flash[:error] = "You can onlu vote on a post once"
          end
            redirect_to :back     
        end
        format.js    
      end    
       
      
  
  end
  
	
  def edit

	

   end
  
  def new
	@post = Post.new

  end
  
  def set_post
     
    @post = Post.find(params[:id])
  end
  def update
    
   if @post.update(post_params)
	flash[:notice] = "This post is updated "
	redirect_to post_path(@post)
   else
	render :edit
   end


   end
 
  private
   def post_params
    params.require(:post).permit(:title, :url, :description, category_ids: [])
  end
end
