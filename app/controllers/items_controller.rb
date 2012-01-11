class ItemsController < ApplicationController
  def edit
    @item = Item.find params[:id]
  end

  def update
    @item = Item.find params[:id]
    if @item.update_attributes params[:item]
      redirect_to quote_path @item.root_node
    else
      flash.now.alert = 'There were some errors.'
      render :edit
    end
  end

  def new
    if params[:parent]
      parent = Node.find params[:parent]
      @item = Item.new parent: parent
    else
      @item = Item.new
    end
  end

  def create
    parent = Node.find params[:item][:parent_id] if params[:item][:parent_id]
    @item = Item.new params[:item].merge(parent: parent)
    if @item.save
      redirect_to quote_path @item.root_node
    else
      flash.alert = 'There were some errors.'
      render :new
    end
  end

  def destroy
    @item = Item.find params[:id]
    @quote = @item.root_node
    @item.destroy
    redirect_to quote_path @quote
  end
end
