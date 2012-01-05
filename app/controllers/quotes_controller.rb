class QuotesController < ApplicationController
  def index
    @quotes = Quote.all
  end
end
