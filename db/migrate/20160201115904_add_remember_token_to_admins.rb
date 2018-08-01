class AddRememberTokenToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :remember_token, :string
  end
end
