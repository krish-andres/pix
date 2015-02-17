class AlbumsController < ApplicationController
  before_action :require_signin
  before_action :find_group
  before_action :find_album, only: [:show, :destroy]
  before_action :check_album_creator, only: [:destroy]

  def new
    @album = @group.albums.new 
  end

  def create
    @album = @group.albums.new(album_params)
    @album.user = current_user
    if @album.save
      redirect_to group_album_path(@group, @album), notice: "Album Successfully Created!"
    else
      render :new
    end
  end

  def show
    @photos = @album.photos
  end

  def destroy
    @album.destroy
    redirect_to @group, notice: "Album Successfully Deleted!"
  end

  private

  def find_group
    @group = Group.find(params[:group_id])
  end

  def album_params
    params.require(:album).permit(:name)
  end

  def find_album
    @album = Album.find(params[:id])
  end

  def check_album_creator
    unless album_creator?(@album, current_user)
      redirect_to root_url, alert: "Unauthorized Access!"
    end
  end
end
