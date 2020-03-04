class DeliveriesController < ApplicationController

  def create
    new_delivery = Delivery.new(delivery_params)
    delivery_hash = new_delivery.tracking(new_delivery)
    delivery = delivery_hash[:delivery]
    history_array = delivery_hash[:history]
    raise
    delivery.user = current_user
    if delivery.save
      history = History.new
      history.create_history(history_array, delivery)
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
    params.require(:delivery).permit(:name, :tracking_number)
  end

  #api stuff

end
