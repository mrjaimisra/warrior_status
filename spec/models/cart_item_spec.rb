require 'rails_helper'

RSpec.describe Item, type: :model do
  let!(:item) { Item.create(title:       "My First Piece",
                            description: "Description",
                            price:       1,
                            item_image_file_name: "sun-rose-feather.jpg",
                            item_image_content_type: "image/jpeg",
                            item_image_file_size: 209772,
                            item_image_updated_at: Date.new ) }

  it 'returns item name' do
    cart_item = CartItem.new(item)
    expect(cart_item.title).to eq('My First Piece')
  end

  it 'returns item quantity' do
    cart_item = CartItem.new(item, 3)
    expect(cart_item.quantity).to eq(3)
  end

end
