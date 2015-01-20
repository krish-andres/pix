class PhotosController < ApplicationController
  before_action :find_user

  def new
    @photo = @user.photos.new
  end

  def create
    @photo = @user.photos.new(photo_params)
    if @photo.save 
      redirect_to @user
    else
      render :new
    end
  end


  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end
end
