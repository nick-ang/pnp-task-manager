class KanbansController < ApplicationController
  before_action :set_kanban, only: %i[ show edit update destroy ]

  # GET /kanbans or /kanbans.json
  def index
    @kanbans = Kanban.all
  end

  # GET /kanbans/1 or /kanbans/1.json
  def show
  end

  # GET /kanbans/new
  def new
    @kanban = Kanban.new
  end

  # GET /kanbans/1/edit
  def edit
  end

  # POST /kanbans or /kanbans.json
  def create
    @kanban = Kanban.new(kanban_params)

    respond_to do |format|
      if @kanban.save
        format.html { redirect_to @kanban, notice: "Kanban was successfully created." }
        format.json { render :show, status: :created, location: @kanban }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kanban.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kanbans/1 or /kanbans/1.json
  def update
    respond_to do |format|
      if @kanban.update(kanban_params)
        format.html { redirect_to @kanban, notice: "Kanban was successfully updated." }
        format.json { render :show, status: :ok, location: @kanban }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kanban.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kanbans/1 or /kanbans/1.json
  def destroy
    @kanban.destroy
    respond_to do |format|
      format.html { redirect_to kanbans_url, notice: "Kanban was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def sort
    # Get the new col sort
    sorted_cols = JSON.parse(kanban_params["kanbanIds"])["columns"]
    sorted_cols.each do |col|
      # Look at each of its cards
      col["itemIds"].each do |task_id|
        # Find the card if in the DB and
        # update its column and position within the column
        Task.find(task_id).update(
          kanban_column: KanbanColumn.find(col["id"]),
          position: col["itemIds"].find_index(task_id),
        )
      end
    end
    @tasks = Task.all
    @tasks.each do |task|
      task.update(status: KanbanColumn.find(task.kanban_column.id).name)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_kanban
    @project = Project.find(params[:project])
    @kanban = Kanban.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def kanban_params
    params.require(:kanban).permit(:name, :description, :kanbanIds)
  end
end
