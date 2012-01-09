class QuotesController < ApplicationController
  def index
    @quotes = Quote.all
  end

  def show
    @quote = Quote.find params[:id]
  rescue ActiveRecord::RecordNotFound => ex
    flash.alert = 'Quote could not be found.'
    redirect_to quotes_path
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(params[:quote])
    if @quote.save
      redirect_to @quote
    end
  end

  def edit
    @quote = Quote.find params[:id]
  end

  def update
    @quote = Quote.find params[:id]
    if @quote.update_attributes params[:quote]
      redirect_to @quote
    else
      flash.now.alert = 'There were some errors.'
      render :edit
    end
  end
end
