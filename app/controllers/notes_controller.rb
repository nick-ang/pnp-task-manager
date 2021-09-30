class NotesController < ApplicationController
  before_action :authenticate_user!

  def index
    @project_new = Project.new
    @notes = current_user.notes
    @projects = Project.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    if @note.save
      redirect_to notes_path
    else
      render :new
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    redirect_to notes_path
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to notes_path
  end

  private

  # def set_project
  #   @project = Project.find(params[:project_id])
  # end

  def note_params
    params.require(:note).permit(:description, :title)
  end
end
