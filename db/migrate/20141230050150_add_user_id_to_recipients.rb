class AddUserIdToRecipients < ActiveRecord::Migration
  def change
    add_column :recipients, :user_id, :integer
    add_index :recipients, :user_id
  end
end
