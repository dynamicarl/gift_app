class Gift < ActiveRecord::Base
	belongs_to :user
	has_attached_file :item_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	has_attached_file :wrapped_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
