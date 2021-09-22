class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications
  end

  # def destroy_all
  #   Notification.destroy_all
  # end
end
