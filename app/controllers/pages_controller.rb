class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]
  helper_method :resource_name, :resource, :devise_mapping, :resource_class

  def home
    CheckApiJob.perform_later
  end

  def about
    @greeting = greeting
  end

  private

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
