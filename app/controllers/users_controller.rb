class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new()
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #success
      flash[:success] = "User Registered on System!"
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user)
            .permit(:username,:email,:password,:password_confirmation)
    end

end
