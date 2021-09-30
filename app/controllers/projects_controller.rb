class ProjectsController < ApplicationController
  before_action :authenticate_user!, :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
    @project_new = Project.new
    @project_edit = Project.find(params[:id])
    @projects = Project.all
    @kanbans = current_user.kanbans
    @kanban = Kanban.where(:project_id => params[:id])

    @kanban_columns = KanbanColumn.where(:kanban_id => @kanban.first.id)
    @tasks = []
    @kanban_columns.each do |column|
      @tasks << column.tasks.first
    end
  end

  def new
    @project_new = Project.new
    @kanban = Kanban.new
  end

  def create
    @project_new = Project.new(project_params)
    @kanban = Kanban.create(
      name: @project_new.name,
      description: "Kanban for #{@project_new.name}.",
      project: @project_new,
    )
    KanbanColumn.create(
      name: "not_started",
      kanban: @kanban,
    )
    KanbanColumn.create(
      name: "in_progress",
      kanban: @kanban,
    )
    KanbanColumn.create(
      name: "completed",
      kanban: @kanban,
    )

    if @project_new.save
      redirect_to @project_new
    else
      render :new
    end
  end

  def edit
    @project_new = Project.new
    @project_edit = Project.find(params[:id])
  end

  def update
    @project_edit = Project.find(params[:id])
    @project_edit.update(project_params)
    redirect_to @project_edit
  end

  def destroy
    @project.destroy
    redirect_to root_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :progress, :status, :end_date, :start_date, :created_by, user_ids: [])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_kanban
    @project = Project.find(params[:project])
    @kanban = Kanban.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def kanban_params
    params.require(:kanban).permit()
  end
end
