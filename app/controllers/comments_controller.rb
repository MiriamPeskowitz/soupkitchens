class CommentsController < ApplicationController
  # before_action :set_comment, only: [:show, :edit, :update, :destroy]




# comment.sk
# comment.sk=
# comment.build_soupkitchen
# comment.create_sk
# comment.create_author!

# belongs_to -- needs a build_ prefix (not association.build method used in has many)


# @comment = comment.build_soupkitchen(soupkitchen_params)
# @soupkitchen = @comment.soupkitchen

  def new
    @soupkitchen = Soupkitchen.find(params[:soupkitchen_id])
    @comment = @soupkitchen.comments.build
  end 

  def create
    @soupkitchen = Soupkitchen.find(params[:soupkitchen_id])
    @comment = @soupkitchen.comments.build(params[comment_params])  
    # or (params[comment_params])
    # params[:comment].permit(:name, :comment)
    if @comment.save 
      redirect_to soupkitchen_path(@soupkitchen)
      # where does data go -- create, associate with soupkitchen 
    else 
      render :new
    end

  end  

 #  def show
 #  end
  
  def edit 
  end

  def update
  end

  def destroy
    @soupkitchen = Soupkitchen.find(params[:soupkitchen_id])
    @comment = @soupkitchen.comments.find(params[:id])
    @comment.destroy
    redirect_to soupkitchen_path(@soupkitchen)
  end

	private	
	def comment_params
		params.require(:comment).permit(:title, :content)
	end
# add user_attributes => ?? 

 #  def set_comment
 #    @comment = Comment.find(params[:id])
 #  end 
end

