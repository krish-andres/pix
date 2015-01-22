class PhotosController < ApplicationController
  before_action :find_user
  before_action :find_photo, only: [:show, :edit, :update, :destroy]

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

  def show
  end


  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_photo
    @photo = @user.photos.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end
end
