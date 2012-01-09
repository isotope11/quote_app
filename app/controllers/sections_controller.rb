class SectionsController < ApplicationController
  def edit
    @section = Section.find params[:id]
  end
end
