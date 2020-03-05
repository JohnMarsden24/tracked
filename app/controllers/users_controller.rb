class UsersController < ApplicationController
  def show
    @user = current_user
    @delivery = Delivery.new
    @tag = Tag.new

    if params[:query].present?
      @deliveries = @user.deliveries.search_by_everything(params[:query])
    else
      @deliveries = @user.deliveries
    end
  end

end
