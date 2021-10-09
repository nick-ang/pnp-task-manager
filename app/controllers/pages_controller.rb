class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @unique_tasks = {}
    if current_user.tasks
      current_user.tasks.each do |task|
        if task.users.include?(current_user)
          if @unique_tasks[task.status]
            @unique_tasks[task.status] += 1
          else
            @unique_tasks[task.status] = 1
          end
        end
      end
    end
    @project_new = Project.new
    @notification = Notification.new
    if Chatroom.all.count > 0
      @chatroom = Chatroom.new
      @message = Message.new
    end
    if current_user
      @notifications = current_user.notifications.unread
      if current_user.admin?
        @projects = Project.all
        @kanbans = Kanban.all
        @kanban_columns = KanbanColumn.all
        @chatrooms = Chatroom.all
      else
        @projects = current_user.projects
        @kanbans = current_user.kanbans
        @kanban_columns = current_user.kanban_columns
        @chatrooms = Chatroom.all
      end
      @users = User.all
      if current_user.admin?
        @tasks = current_user.tasks
      elsif current_user.tasks
        @tasks = Task.where(user_id: current_user)
        @messages = Message.all
      end
    end
  end
end
