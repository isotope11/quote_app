class SectionsController < ApplicationController
  def edit
    @section = Section.find params[:id]
  end

  def update
    @section = Section.find params[:id]

    case params[:move]
    when 'up'
      @section.move_left if @section.left_sibling
    when 'down'
      @section.move_right if @section.right_sibling
    end

    if @section.update_attributes params[:section]
      redirect_to quote_path @section.root
    else
      flash.now.alert = 'There were some errors.'
      render :edit
    end
  end

  def new
    @section = Section.new parent_id: Node.find(params[:parent]).id
  end

  def create
    parent = Node.find params[:section][:parent_id]
    @section = Section.create params[:section].merge parent: parent
    redirect_to quote_path @section.root
  end

  def destroy
    @section = Section.find params[:id]
    @quote = @section.root
    @section.destroy
    redirect_to quote_path @quote
  end
end
