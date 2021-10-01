class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?
  before_action :demo_user
  before_action :home

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :position, :phone, :gender])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :position, :phone, :gender])
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def home
    @project_new = Project.new
    @notification = Notification.new
    if Chatroom.all.count > 0
      @chatroom = Chatroom.new
      @message = Message.new
    end
    if current_user
      @notifications = current_user.notifications
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
        @tasks = Task.all
      elsif current_user.tasks
        @tasks = current_user.tasks
        @messages = Message.all
      end
    end
  end

  def demo_user
    @project_new = Project.new
    @project_edit = Project.new
    if User.all.length > 6
      @demo = User.find(6)
    else
      @demo = User.first
    end
  end
end
