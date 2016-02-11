require 'rails_helper'

RSpec.describe Cart, type: :model do
  let!(:item) { Item.create(title:       "My First Piece",
                            description: "Description",
                            price:       1,
                            item_image_file_name: "sun-rose-feather.jpg",
                            item_image_content_type: "image/jpeg",
                            item_image_file_size: 209772,
                            item_image_updated_at: Date.new ) }
  it "is available" do
    expect(Cart).to be
  end

  context "#items" do
    it "returns cart items" do
      data = Hash.new(0)
      data[item.id] = 2
      cart = Cart.new(data)
      expect(cart.items.first).to be_a_kind_of(CartItem)
    end
  end

  context "#data" do
    it "returns a data hash" do
      data = {}
      data[item.id.to_s] = 2
      cart = Cart.new(data)
      expect(cart.data).to eq({item.id.to_s => 2})
    end
  end

  context "#add_item" do
    it "updates data with new item" do
      cart = Cart.new(nil)

      cart.add_item(item)
      expect(cart.data).to eq({item.id.to_s => 1})

      cart.add_item(item)
      expect(cart.data).to eq({item.id.to_s => 2})

      cart.add_item(item)
      expect(cart.data).to eq({item.id.to_s => 3})
    end
  end

  context "#destroy_item" do
    it "deletes item from cart" do
      cart = Cart.new(nil)

      cart.add_item(item)
      expect(cart.data).to eq({item.id.to_s => 1})

      cart.add_item(item)
      expect(cart.data).to eq({item.id.to_s => 2})

      cart.remove_item(item.id)
      expect(cart.data).to eq({})
    end
  end

  context "#update_item" do
    it "changes quantity to item fromm cart" do
      cart = Cart.new(nil)

      cart.add_item(item)
      expect(cart.data).to eq({item.id.to_s => 1})

      cart.update_item(item.id, 4)
      expect(cart.data).to eq({item.id.to_s => 4})
    end
  end

end
