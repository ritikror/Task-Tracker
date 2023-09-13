class RemovePasswordDigestToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :encrypted_password
    rename_column :users, :password_digest, :encrypted_password
  end
end
