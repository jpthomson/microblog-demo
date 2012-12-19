class BleatsController < ApplicationController
  load_and_authorize_resource :except => :create

  def create
    @user = User.find(params[:user_id])
    @bleat = @user.bleats.build(params[:bleat])
    authorize! :create, @bleat
    @bleat.save

    redirect_to user_path(@user)
  end
  
  def destroy
    @bleat = Bleat.find(params[:id])
    @user = @bleat.user
    @bleat.destroy

    redirect_to user_path(@user)
  end
end

