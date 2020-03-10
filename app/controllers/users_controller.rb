class UsersController < ApplicationController
  def show
    # @delivered = current_user.deliveries.where(status: "Delivered")
    @delivery = Delivery.new
    @tag = Tag.new
    # @deliveries = current_user.deliveries
    if params[:query].present?
      @deliveries = current_user.deliveries.includes(:history, :tags).search_by_everything(params[:query])
    else
      @in_transit = current_user.deliveries.where(status: "On its way")
      @delayed = current_user.deliveries.where(status: "Delayed")
      @delivered = current_user.deliveries.where(status: "Delivered")
    end
  end

  # private

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
