class AddAttachmentWrappedImageToGifts < ActiveRecord::Migration
  def self.up
    change_table :gifts do |t|
      t.attachment :wrapped_image
    end
  end

  def self.down
    remove_attachment :gifts, :wrapped_image
  end
end
