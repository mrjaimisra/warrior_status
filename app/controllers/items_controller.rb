class ItemsController < ApplicationController
  before_action :authorize!, only: [ :new, :create ]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to store_path
    else
      render :new
    end
  end

  private

    def item_params
      params.require(:item).permit(:title, :description, :price, :item_image)
    end
end
