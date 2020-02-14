class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User Registered on System!'
      redirect_to new_user_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    debugger
    if @user.update_attributes(user_params)
      flash[:success] = 'User Updated on System!'
      redirect_to new_user_path
    else
      flash[:error] = 'User Updated Fail System!'
    end
  end

  private

  def user_params
    params
      .permit(:username, :email, :password, :password_confirmation)
  end
end
