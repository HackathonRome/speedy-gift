class WelcomeController < ApplicationController
  def index
  end

  def friends
    @friends = current_user.friends
  end
end
