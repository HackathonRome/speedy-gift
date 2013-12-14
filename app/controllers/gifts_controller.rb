require Rails.root.join 'lib/gift_search/all_sites'
require Rails.root.join 'lib/gift_search/gyft'

class GiftsController < ApplicationController
  has_mobile_fu

  respond_to :html, :json

  before_filter :load_friend
  before_filter :load_gift_keyword
  before_filter :find_gifts

  def index
    if is_mobile_device?
      redirect_to random_gifts_path(friend_id: params[:friend_id])
    else
      respond_with @gifts
    end
  end

  def random
    @gift = @gifts.sample
    respond_with @gift
  end
  
  def pippo
    render text: GiftSearch::Gyft.new(params[:query] || 'apple').execute
  end

  private

    def load_friend
      @friend = current_user.friend(params[:friend_id])
    end

    def load_gift_keyword
      @gift_keyword = @friend.gift_keyword
    end

    def find_gifts
      @gifts = @gift_keyword ? GiftSearch::AllSites.new(@gift_keyword).execute : nil
    end

end
