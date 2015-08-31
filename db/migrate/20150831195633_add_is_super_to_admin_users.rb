class AddIsSuperToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :is_super, :boolean, default: false, null: false
  end
end
