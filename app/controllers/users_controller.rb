class UsersController < ApplicationController
  def show
    @delivery = Delivery.new
    @tag = Tag.new
    @greeting = greeting
    if params[:query].present?
      @deliveries = current_user.deliveries.includes(:history, :tags).search_by_everything(params[:query])
      @in_transit = current_user.deliveries.where(status: "On its way")
      @delayed = current_user.deliveries.where(status: "Delayed")
      @delivered = current_user.deliveries.where(status: "Delivered")
    else
      @in_transit = current_user.deliveries.where(status: "On its way")
      @delayed = current_user.deliveries.where(status: "Delayed")
      @delivered = current_user.deliveries.where(status: "Delivered")
    end
  end

  # private

  def greeting
    if Time.now.hour <= 12
      "Good morning, "
    elsif Time.now.hour <= 18
      "Good afternoon, "
    else
      "Good evening, "
    end
  end

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
