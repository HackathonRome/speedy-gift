require Rails.root.join 'lib/gift_search/amazon'

class GiftsController < ApplicationController
  respond_to :html, :json

  def index
    @gifts = GiftSearch::Amazon.new(params[:query]).execute
    respond_with @gifts
  end
end
