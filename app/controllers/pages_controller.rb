class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @notification = Notification.new
    if Chatroom.all.count > 0
      @chatroom = Chatroom.new
      @message = Message.new
    end
    if current_user
      @notifications = current_user.notifications
      if current_user.admin?
        @projects = Project.all
        @chatrooms = Chatroom.all
      else
        @projects = current_user.projects
        @chatrooms = Chatroom.all
      end
      @users = User.all
      if current_user.admin?
        @tasks = Task.all
      elsif current_user.tasks
        @tasks = current_user.tasks
        @messages = Message.all
      end
    end
  end
end
