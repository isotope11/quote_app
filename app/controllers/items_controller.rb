class ItemsController < ApplicationController
  def new
    @item = Item.new
    @item.parent = Node.find_by_id(params[:parent])
    @item.item_template = ItemTemplate.find_by_id(params[:item_template])

    if @item.item_template
      @item.description = @item.item_template.description
      @item.min_hours = @item.item_template.min_hours
      @item.max_hours = @item.item_template.max_hours
    else
      @item_templates = ItemTemplate.all
    end
  end

  def edit
    @item = Item.find params[:id]
  end

  def update
    @item = Item.find params[:id]

    case params[:move]
    when 'up'
      @item.move_left if @item.left_sibling
    when 'down'
      @item.move_right if @item.right_sibling
    end

    if @item.update_attributes params[:item]
      redirect_to quote_path @item.root
    else
      flash.now.alert = 'There were some errors.'
      render :edit
    end
  end

  def create
    @item = Item.new(params[:item])
    @item.parent = Node.find_by_id(params[:item][:parent_id])
    @item.item_template = ItemTemplate.find_by_id(params[:item][:item_template_id])

    if @item.save
      redirect_to quote_path @item.root
    else
      flash.alert = 'There were some errors.'
      render :new
    end
  end

  def destroy
    @item = Item.find params[:id]
    @quote = @item.root
    @item.destroy
    redirect_to quote_path @quote
  end
end
