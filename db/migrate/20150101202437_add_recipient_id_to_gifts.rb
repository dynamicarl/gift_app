class AddRecipientIdToGifts < ActiveRecord::Migration
  def change
    add_column :gifts, :recipient_id, :integer
    add_index :gifts, :recipient_id
  end
end
