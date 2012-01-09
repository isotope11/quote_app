class SectionsController < ApplicationController
  def edit
    @section = Section.find params[:id]
  end

  def update
    @section = Section.find params[:id]
    if @section.update_attributes params[:section]
      redirect_to quote_path @section.parent
    else
      flash.alert = 'There were some errors.'
      render :edit
    end
  end
end
