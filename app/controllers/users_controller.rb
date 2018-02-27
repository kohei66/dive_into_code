class UsersController < ApplicationController
  def new
    @user=User.new
  end

  def create
    @user=User.new(strong_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render "new"
    end
   end

  def show
    @user=User.find(params[:id])
  end

  private
  def strong_params
    params.require(:user).permit(:email,:name,:password,:password_confirmation)
  end

end