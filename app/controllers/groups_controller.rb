class GroupsController < ApplicationController
  before_action :require_signin
  before_action :find_group, except: [:index, :new, :create]
  before_action :check_group_admin, only: [:edit, :update, :destroy]

  def index
    @groups = current_user.groups    
  end

  def show
    @albums = @group.albums
  end

  def new
    @group = current_user.groups.new
  end

  def create
    @group = current_user.groups.new(group_params)
    @group.users << current_user
    if @group.save  
      @user_group = current_user.user_groups.find_by(group: @group)
      @user_group.admin = true
      @user_group.save
      redirect_to @group, notice: "Group Successfully Created!"
    else 
      render :new
    end
  end

  def edit
  end

  def update  
  end

  def destroy
    @group.destroy
    redirect_to root_url, notice: "Group Successfully Deleted!"
  end

  private

  def find_group
    @group = current_user.groups.find(params[:id]) 
  end

  def group_params
    params.require(:group).permit(:name, :image)
  end

  def check_group_admin
    unless is_group_admin?(current_user, @group)
      redirect_to root_url, alert: "Unauthorized Access!"
    end
  end
end
