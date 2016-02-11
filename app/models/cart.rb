class Cart
  attr_reader :data

  def initialize(input_data = {})
    @data = input_data || Hash.new
  end

  def items
    @data.map do |item_id, quantity|
      item = Item.find(item_id)
      CartItem.new(item, quantity)
    end
  end

  def add_item(item)
    data[item.id.to_s] ||= 0
    data[item.id.to_s] += 1
  end

  def remove_item(item_id)
    data.delete(item_id.to_s)
  end

  def update_item(item_id, quantity)
    data[item_id.to_s] = quantity.to_i
  end

end
