require Rails.root.join 'lib/gift_search/amazon'

class GiftsController < ApplicationController
  respond_to :html, :json
  before_filter :search_for_gifts, on: [:index, :random]

  def index
    respond_with @gifts
  end

  def random
    @gift = @gifts.sample
    respond_with @gift
  end

  private
    def search_for_gifts
      @gifts = GiftSearch::Amazon.new(params[:query]).execute
    end
end
