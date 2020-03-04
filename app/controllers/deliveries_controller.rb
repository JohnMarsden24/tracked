class DeliveriesController < ApplicationController

  def create
    new_delivery = Delivery.new(delivery_params)
    delivery_data = new_delivery.tracking(new_delivery)
    delivery = delivery_data[:delivery]
    history_array = delivery_data[:history]
    delivery.user = current_user
    delivery.courier_slug = delivery_hash[:delivery][:courier_slug]
    delivery.expected_arrival_date = delivery_hash[:expected_arrival_date]
    if delivery.save
      new_history = History.new
      new_history.create_history(history_array, delivery)
      new_history.save
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
