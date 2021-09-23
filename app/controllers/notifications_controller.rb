class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notification = Notification.new
    @notifications = current_user.notifications
  end
end
