class QuotesController < ApplicationController
  def index
    @quotes = Quote.all
  end

  def show
    @quote = Quote.find_by_uuid params[:id]
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(params[:quote])
    if @quote.save
      redirect_to @quote
    else
      flash.now.alert = 'There were some errors.'
      render :new
    end
  end

  def edit
    @quote = Quote.find_by_uuid params[:id]
  end

  def update
    @quote = Quote.find_by_uuid params[:id]
    if @quote.update_attributes params[:quote]
      redirect_to @quote
    else
      flash.now.alert = 'There were some errors.'
      render :edit
    end
  end

  def client_select
    @quote = Quote.find(params[:id])
    @response = XronoImport.new.get_clients
    @clients = @response.map{|client| [client["name"], client["id"]]}
  end

  def send_to_xrono
    @quote = Quote.find(params[:id])
    if params[:client_id].present? && !@quote.processed?
      XronoImport.new.send_quote(@quote, params[:client_id])
      @quote.update_attributes(:processed => true)
      flash.notice = 'The quote has been imported into Xrono.'
    else
      flash.alert = 'You must first select a client in Xrono, in order to import this quote!'
    end
    redirect_to root_path
  end

end
