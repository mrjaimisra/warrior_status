class ItemsController < ApplicationController
  before_action :authorize!, only: [ :new, :create ]

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
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

  def edit
    @item = Item.find_by(id: params[:id])
  end

  def update
    @item = Item.find_by(id: params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find_by(id: params[:id])
    @item.destroy
    redirect_to store_path
  end

  private

    def item_params
      params.require(:item).permit(:title, :description, :price, :category_id,
                                   :item_image)
    end
end
