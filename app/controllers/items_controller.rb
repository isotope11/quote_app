class ItemsController < ApplicationController
  def edit
    @item = Item.find params[:id]
  end
end
