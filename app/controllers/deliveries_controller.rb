class DeliveriesController < ApplicationController

  # def create
  #   new_delivery = Delivery.new(delivery_params)
  #   delivery_data = new_delivery.tracking(new_delivery)
  #   delivery = delivery_data[:delivery]
  #   history_array = delivery_data[:history]
  #   delivery.user = current_user
  #   delivery.courier_slug = delivery_data[:delivery][:courier_slug]
  #   delivery.expected_arrival_date = delivery_data[:expected_arrival_date]
  #   if delivery.save
  #     new_history = History.new
  #     new_history.create_history(history_array, delivery)
  #     new_history.save
  #     redirect_to user_path(current_user)
  #   else
  #     render "users/show"
  #   end
  # end

  def destroy
  end

  def edit
    @user = current_user
    @delivery = Delivery.find(params[:id])
  end

  def update
    @user = current_user
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def create
    delivery = Delivery.new(delivery_params)
    delivery.user = current_user
    if delivery.valid?
    delivery_data = delivery.tracking
      delivery.save
        if delivery.status == "Error"
          delivery.destroy
          flash[:notice] = "We weren't able to find information on that tracking number!"
          redirect_to user_path(current_user)
        else
          History.create_history(delivery_data, delivery)
          redirect_to user_path(current_user)
        end
    else
      flash[:notice] = "Please enter a tracking number and courier!"
      redirect_to user_path(current_user)
    end
  end

  # if reponse["data"]["tracking"]["tag"] == "pending"

  def test
  end


  private

  def find_courier
    # regex stuff
  end

  def delivery_params
    params.require(:delivery).permit(:name, :tracking_number, :courier)
  end
end
