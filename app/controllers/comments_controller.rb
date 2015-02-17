class CommentsController < ApplicationController
  before_action :require_signin
  before_action :find_photo
  before_action :correct_user, only: [:destroy]

  def create
    @comment = @photo.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to :back
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end



  private

  def find_photo
    @photo = Photo.find(params[:photo_id])
  end


  def comment_params
    params.require(:comment).permit(:body)
  end

  def correct_user
    comment = current_user.comments.find_by(id: params[:id])

    if comment.nil?
      redirect_to photo_comment_path(@photo, @comment), alert: "Not authorized to edit this photo!"
    end
  end
end
