class CommentsController < ApplicationController
  before_action :require_signin
  before_action :find_photo

  def create
    @comment = @photo.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to :back
    end
  end





  private

  def find_photo
    @photo = Photo.find(params[:photo_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
