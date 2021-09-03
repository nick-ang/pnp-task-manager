class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update]

  # As a User, I can view my profile
  def show
    @user = User.find(params[:id])
  end

  # As a user I can edit and update my profile
  def edit
  end

  def update
    @user.update(user_params)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :position, :date_created, :date_modified, :phone, :gender)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
