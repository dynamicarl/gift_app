class AddAttachmentItemImageToGifts < ActiveRecord::Migration
  def self.up
    change_table :gifts do |t|
      t.attachment :item_image
    end
  end

  def self.down
    remove_attachment :gifts, :item_image
  end
end
