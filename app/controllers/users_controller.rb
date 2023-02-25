class UsersController < ApplicationController
  def new
    # byebug
    # @user = User.new
  end

  def create
    # byebug
    @user = User.new(user_params)
    if @user.save
      # This logs the user in after they sign up successfully.
      session[:user_id] = @user.id
      redirect_to root_path
    else
      # byebug
      render :new, status: :unprocessable_entity, flash: { error: @user.errors.full_messages }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
