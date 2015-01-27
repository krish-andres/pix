class PhotosController < ApplicationController
  before_action :require_signin
  before_action :find_photo, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @photo = current_user.photos.new
  end

  def create
    @photo = current_user.photos.new(photo_params)
    if @photo.save 
      redirect_to current_user
    else
      render :new
    end
  end

  def show
    @comments = @photo.comments
    @new_comment = @photo.comments.new
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
    redirect_to current_user
  end


  private

  def find_photo
    @photo = Photo.find(params[:id])
  end

  def correct_user
    photo = current_user.photos.find_by(id: params[:id])

    if photo.nil?
      redirect_to photo_path(@photo), alert: "Not authorized to edit this photo!"
    end
  end

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end
end
