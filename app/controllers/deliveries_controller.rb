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
  end

  def update
  end

  def create
        @delivery = Delivery.new(delivery_params)
    @delivery.user = current_user

    if !params[:delivery][:courier].nil?
      # write what to do here
      @delivery_data = @delivery.tracking
      if @delivery.save
        History.create_history(@delivery_data, @delivery)
        redirect_to user_path(current_user)
      elses
        redirect_to user_path(current_user)
      end

    else

    @delivery_data = @delivery.find_courier(params[:delivery]["tracking_number"])
    if @delivery_data.count == 1
      @delivery.first_tracking(@delivery_data.values[0], params[:delivery]["tracking_number"])
      if @delivery.save
        History.create_history(@delivery_data, @delivery)
        redirect_to user_path(current_user)
      else
        redirect_to user_path(current_user)
      end
    else
      @name = params[:delivery]["name"]
      @tracking_number = params[:delivery]["tracking_number"]
      render :template => "shared/form"
    end
  end
  end

  #   def create
  #   delivery = Delivery.new(delivery_params)
  #   delivery.user = current_user
  #   delivery_data = delivery.tracking
  #   if delivery.save
  #     History.create_history(delivery_data, delivery)
  #     redirect_to user_path(current_user)
  #   else
  #     render "users/show"
  #   end
  # end

  def test
  end


  private

  def find_courier
    # regex stuff
  end

  def delivery_params
    params.require(:delivery).permit(:name, :tracking_number, :courier)
  end

  #api stuff

end
