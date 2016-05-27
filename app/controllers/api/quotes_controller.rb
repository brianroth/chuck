class Api::QuotesController < ApplicationController

  def random_quote
    offset = rand(Quote.count)
    quote = Quote.offset(offset).first

    render json: "\"#{quote.message}\""
  end
end
