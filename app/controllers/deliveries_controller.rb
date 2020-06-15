class DeliveriesController < ApplicationController

  def destroy
    @delivery = Delivery.find(params[:user_id])
    @user = @delivery.user
    if @delivery.fake == false
      AfterShip::V4::Tracking.delete(@delivery.courier_slug, @delivery.tracking_api)
    end
    @delivery.destroy
    redirect_to user_path(@user)
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

  private

  def delivery_params
    params.require(:delivery).permit(:name, :tracking_number, :courier)
  end
end
