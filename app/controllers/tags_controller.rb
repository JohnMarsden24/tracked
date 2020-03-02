class TagsController < ApplicationController

  def create
    @tag = Tag.new(tags_params)
    @tag.delivery = Delivery.find(params[:delivery_id])
    if @tag.save
      redirect_to user_path(current_user)
    else
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to user_path
  end

  private

  def tags_params
    params.require(:tag).permit(:name)
  end

end
