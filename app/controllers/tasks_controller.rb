class TasksController < ApplicationController
  # before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.where(project_id: params[:project_id])
  end

  # def show
  #   @task = Task.find(params[:id])
  # end

  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
  end

  def create
    @project = Project.find(params[:project_id])
    @task = Task.new(task_params)
    @task.project = @project
    if @task.save
      redirect_to root_path
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
    redirect_to root_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path
  end

  private

  # def set_project
  #   @project = Project.find(params[:project_id])
  # end

  def task_params
    params.require(:task).permit(:name, :description, :due_date, :status, :created_by, :priority, user_ids: [])
  end
end
