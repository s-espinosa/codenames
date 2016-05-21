class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      AddTeamAndRole.new(@user, params[:user][:game])
      redirect_to user_path(@user)
    else
      redirect_to new_game_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end
end
