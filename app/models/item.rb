class Item < ActiveRecord::Base
  has_attached_file :item_image, styles: { large: "800x800>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :item_image, content_type: /\Aimage\/.*\Z/

  validates :title, :description, :price, :item_image, presence: true
  validates :price, numericality: { only_integer: true }
end
