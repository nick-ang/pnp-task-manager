class TasksController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.where(project_id: params[:project_id])
    @projects = Project.all
  end

  # def show
  #   @task = Task.find(params[:id])
  # end

  def new
    @task = Task.new
    @project_new = Project.new
  end

  def create
    @project = Project.find(params[:project_id])
    @task = Task.new(task_params)
    @kanban = Kanban.where(:project_id => params[:project_id])
    @kanban_columns = KanbanColumn.where(:kanban_id => @kanban.first.id)
    if @task.status == "not_started"
      @task.kanban_column = @kanban_columns[0]
    elsif @task.status == "in_progress"
      @task.kanban_column = @kanban_columns[1]
    elsif @task.status == "completed"
      @task.kanban_column = @kanban_columns[2]
    else
      @task.kanban_column = nil
    end
    if @task.save
      redirect_to @project
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    @kanban_column = @task.kanban_column
    @kanban = @kanban_column.kanban
    @project = @kanban.project
    redirect_to @project
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    @kanban_column = @task.kanban_column
    @kanban = @kanban_column.kanban
    @project = @kanban.project
    redirect_to @project
  end

  private

  # def set_project
  #   @project = Project.find(params[:project_id])
  # end

  def task_params
    params.require(:task).permit(:name, :description, :due_date, :status, :created_by, :priority, user_ids: [])
  end
end
