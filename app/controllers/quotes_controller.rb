class QuotesController < ApplicationController
  helper_method :quotes_collection

  def index
    @quotes = Quote.all
  end

  def show
    @quote = Quote.find_by_uuid params[:id]

    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "quote.pdf", :print_media_type => true
      end
    end
  end

  def new
    @quote = Quote.new
    @clone = params[:clone]
  end

  def create
    attributes = params[:quote]
    uuid = attributes.delete(:clone)
    original = Quote.find_by_uuid(uuid)

    if original
      @quote = original.dup_branch
      @quote.attributes = @quote.attributes.merge(attributes)
    else
      @quote = Quote.new(attributes)
    end

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

  def quotes_collection
    Quote.all.map { |quote| [ quote.description, quote.uuid ] }
  end
end
