class PhotosController < ApplicationController
  before_action :require_signin
  before_action :find_group
  before_action :find_album
  before_action :find_photo, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @photo = @album.photos.new
  end

  def create
    @photo = @album.photos.new(photo_params)
    @photo.user = current_user
    if @photo.save 
      redirect_to group_album_path(@group, @album), notice: "Photo Successfully Created!"
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
      redirect_to @photo, notice: "Photo Successfully Updated!"
    else 
      render :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to group_album_path(@group, @album)
  end


  private

  def find_photo
    @photo = Photo.find(params[:id])
  end

  def find_album
    @album = Album.find(params[:album_id])
  end

  def find_group
    @group = Group.find(params[:group_id])
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
