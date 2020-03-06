class UsersController < ApplicationController
  def show
    # @active = Delivery.where(:status != "Delivered")
    @delivered = current_user.deliveries.where(status: "Delivered")
    @delivery = Delivery.new
    @tag = Tag.new
    if params[:query].present?
      @deliveries = current_user.deliveries.includes(:history, :tags).search_by_everything(params[:query])
    else
      @deliveries = current_user.deliveries.where.not(status: "Delivered")
    end
  end
end
