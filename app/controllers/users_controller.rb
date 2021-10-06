class UsersController < ApplicationController
  before_action :authenticate_user!, :find_user, only: %i[show edit update]

  # As a User, I can view my profile
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    @q = User.ransack(params[:q])
    @search = @q.result(distinct: true)
  end

  # As a user I can edit and update my profile
  def edit
    @date = @user.last_pay
    @cycle = @user.pay_cycle
    @now = DateTime.now
    @diff = -1 * (@date - @now) / 60 / 60 / 24
    if @cycle == "Weekly"
      @next = @date + 7 * 24 * 60 * 60
      if @diff > 4
        @user.pay_due = "Yes"
      else
        @user.pay_due = "No"
      end
    elsif @cycle == "Fortnightly"
      @next = @date + 14 * 24 * 60 * 60
      if @diff > 11
        @user.pay_due = "Yes"
      else
        @user.pay_due = "No"
      end
    else
      @next = @date + 28 * 24 * 60 * 60
      if @diff > 25
        @user.pay_due = "Yes"
      else
        @user.pay_due = "No"
      end
    end
  end

  def update
    @user.update(user_params)
    @date = @user.last_pay
    @cycle = @user.pay_cycle
    @now = DateTime.now
    @diff = -1 * (@date - @now) / 60 / 60 / 24
    if @cycle == "Weekly"
      @next = @date + 7
      if @diff > 4
        @user.pay_due = "Yes"
      else
        @user.pay_due = "No"
      end
    elsif @cycle == "Fortnightly"
      @next = @date + 14
      if @diff > 11
        @user.pay_due = "Yes"
      else
        @user.pay_due = "No"
      end
    else
      @next = @date + 28
      if @diff > 25
        @user.pay_due = "Yes"
      else
        @user.pay_due = "No"
      end
    end
    @user.save
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :position, :date_created, :date_modified, :phone, :gender, :salary, :pay_cycle, :last_pay, :birthdate, :tfn, :bank_account, :bank_bsb, :pay_due)
  end

  def find_user
    @user = User.find(params[:id])
    @project_new = Project.new
  end
end
