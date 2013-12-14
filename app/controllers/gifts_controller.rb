require Rails.root.join 'lib/gift_search/all_sites'

class GiftsController < ApplicationController

  respond_to :html, :json

  before_filter :load_friend
  before_filter :load_gift_keyword
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

    def load_gift_keyword
      @gift_keyword = @friend.gift_keyword
    end

    def find_gifts
      @gifts = GiftSearch::AllSites.new(@gift_keyword).execute
    end

end
