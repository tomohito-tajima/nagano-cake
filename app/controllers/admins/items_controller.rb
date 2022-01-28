class Admins::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item)
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update
    redirect_to admins_item_path(@item)
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre, :proce, :is_active)
  end

end
