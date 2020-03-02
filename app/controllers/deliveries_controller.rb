class DeliveriesController < ApplicationController

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.user = current_user
    if @delivery.save
      redirect_to user_path(current_user)
    else
      render "users/show"
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private

  def find_courier
    # regex stuff
  end

  def delivery_params
    params.require(:delivery).permit(:name, :courier, :tracking_number)
  end

  #api stuff

end
