class TagsController < ApplicationController

  def create
    @tag = Tag.new(tags_params)
    @tag.delivery = Delivery.find(params[:delivery_id])
    if @tag.save
      redirect_to user_path(current_user, anchor: "tag-#{@tag.id}")
    else
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    delivery = @tag.delivery
    @tag.destroy
    redirect_to user_path(current_user, anchor: "delivery-#{delivery.id}")
  end

  private

  def tags_params
    params.require(:tag).permit(:name)
  end

end
