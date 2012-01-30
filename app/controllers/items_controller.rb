class ItemsController < ApplicationController
  def new
    @parent = Node.find_by_id params[:parent]
    @item_templates = ItemTemplate.all
    if @item_template = ItemTemplate.find_by_id(params[:item_template])
      description = @item_template.description
      min_hours = @item_template.min_hours
      max_hours = @item_template.max_hours
    end
    @item = Item.new parent: @parent, description: description, min_hours: min_hours, max_hours: max_hours, item_template: @item_template
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
      redirect_to quote_path @item.root_node
    else
      flash.now.alert = 'There were some errors.'
      render :edit
    end
  end

  def create
    @parent = Node.find_by_id params[:item][:parent_id]
    @item_template = ItemTemplate.find_by_id params[:item][:item_template_id]
    @item = Item.new params[:item].merge(parent: @parent, item_template: @item_template)
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
