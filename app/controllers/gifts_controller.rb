require Rails.root.join 'lib/gift_search/amazon'

class GiftsController < ApplicationController
  respond_to :html, :json
  before_filter :load_friend
  before_filter :find_gifts

  def index
    respond_with @gifts
  end

  def random
    @gift = @gifts.sample
    respond_with @gift
  end

  private
    def load_friend
      @friend = current_user.friend(params[:friend_id])
    end

    def find_gifts
      @gifts = GiftSearch::Amazon.new(@friend.gift_keyword).execute
    end
end
