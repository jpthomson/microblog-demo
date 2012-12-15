class BleatsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @bleat = @user.bleats.create(params[:bleat])
    redirect_to user_path(@user)
  end
  
  def destroy
    @bleat = Bleat.find(params[:id])
    @user = @bleat.user
    @bleat.destroy
    redirect_to user_path(@user)
  end
end

