class UsersController < ApplicationController
  def show
    @user = current_user
    @delivery = Delivery.new
  end
end
