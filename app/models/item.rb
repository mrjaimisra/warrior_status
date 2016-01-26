class Item < ActiveRecord::Base
  mount_uploader :item_image, ItemImageUploader
end
