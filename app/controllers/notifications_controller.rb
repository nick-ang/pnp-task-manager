class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.mark_as_read!
  end
end
