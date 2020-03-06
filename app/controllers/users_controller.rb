class UsersController < ApplicationController
  def show
    @user = current_user
    @delivery = Delivery.new
    @tag = Tag.new

    if params[:query].present?
      @deliveries = @user.deliveries.includes(:history, :tags).search_by_everything(params[:query])
    else
      @deliveries = @user.deliveries.includes(:history, :tags).all
    end
  end

end
