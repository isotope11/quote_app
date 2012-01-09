class SectionsController < ApplicationController
  def edit
    @section = Section.find params[:id]
  end

  def update
    @section = Section.find params[:id]
    if @section.update_attributes params[:section]
      redirect_to quote_path @section.root_node
    else
      flash.now.alert = 'There were some errors.'
      render :edit
    end
  end

  def new
    @section = Section.new parent: Node.find(params[:parent])
  end

  def create
    parent = Node.find params[:section][:parent_id]
    @section = Section.create params[:section].merge parent: parent
    redirect_to quote_path @section.root_node
  end

  def destroy
    @section = Section.find params[:id]
    @quote = @section.root_node
    @section.destroy
    redirect_to quote_path @quote
  end
end
