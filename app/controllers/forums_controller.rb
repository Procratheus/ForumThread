class ForumsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_forum, except: [:index, :new, :create]

  def index
    @q = Forum.ransack(params[:q])
    @forums = @q.result
  end

  def show

  end

  def new
    @forum = Forum.new
    @forum.posts.new
  end

  def create
    @forum = current_user.forums.new(forum_params)
    @forum.posts.first.user_id = current_user.id

    if @forum.save
      redirect_to @forum
    else
      render action: :new
    end
  end

  def edit
  end

  private

    def set_forum
      @forum = Forum.find(params[:id])
    end

    def forum_params
      params.require(:forum).permit(:title, posts_attributes: [:body])
    end
end
