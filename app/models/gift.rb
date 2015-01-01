class Gift < ActiveRecord::Base
	belongs_to :user
	has_attached_file :item_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	has_attached_file :wrapped_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :item_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates_attachment_content_type :wrapped_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	
	belongs_to :recipient
end
