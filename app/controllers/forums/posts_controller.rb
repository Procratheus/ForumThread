class Forums::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @forum = Forum.find(params[:forum_id])
    @forum.posts.new
  end

  def create
    @forum = Forum.find(params[:forum_id])
    @post = @forum.posts.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      @post.send_notifications!
      redirect_to forum_path(@forum, anchor: "post_#{@post.id}")
    else
      render :new
    end
  end

  private

   def post_params
     params.require(:post).permit(:body)
   end

end
