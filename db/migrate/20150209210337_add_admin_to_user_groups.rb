class AddAdminToUserGroups < ActiveRecord::Migration
  def change
    add_column :user_groups, :admin, :boolean, default: false
  end
end
