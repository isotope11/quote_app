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
    api_url = "http://192.168.1.83:3000"
    conn = Faraday.new(:url => api_url)
    @response = conn.get("/api/v1/clients.json")
    @clients = ActiveSupport::JSON.decode(@response.body)
    @clients = @clients.map{|client| [client["name"], client["id"]]}
  end

  def send_to_xrono
    @quote = Quote.find(params[:id])
    if params[:client_id].present? && !@quote.processed?
      @quote.create_in_xrono(params[:client_id])
      @quote.update_attributes(:processed => true)
      flash.notice = 'The quote has been imported into Xrono.'
    else
      flash.alert = 'You must first select a client in Xrono, in order to import this quote!'
    end
    redirect_to root_path
  end

end
