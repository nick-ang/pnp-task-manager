# To deliver this notification:
#
# TaskNotification.with(post: @post).deliver_later(current_user)
# TaskNotification.with(post: @post).deliver(current_user)

class TaskNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :task

  # Define helper methods to make rendering easier.
  #
  def message
    @task = params[:task]
    "You have been assigned to a new task: #{@task.name}"
  end

  def url
    @task = params[:task]
    @project = params[:task].kanban_column.kanban.project
    @record.mark_as_read!
    project_path(@project)
  end
end
