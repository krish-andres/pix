class PhotosController < ApplicationController
  before_action :find_user
  before_action :find_photo, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    if @photo.update(photo_params)
      redirect_to @photo, notice: "Photo Successfully Updated"
    else 
      render :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to @user
  end


  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_photo
    @photo = @user.photos.find(params[:id])
  end

  def correct_user
    photo = current_user.photos.find_by(id: params[:id])

    if photo.nil?
      redirect_to user_photo_path(@user, @photo), alert: "Not authorized to edit this photo!"
    end
  end

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end
end
