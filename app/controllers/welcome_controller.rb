class WelcomeController < ApplicationController

  def index
    redirect_to '/friends' if current_user
  end

  def friends
    @friends = current_user.friends
  end

end
