class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
    @projects = Project.all
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user
    if @wiki.save
      redirect_to wikis_path
    else
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.update(wiki_params)
    redirect_to wikis_path
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    @wiki.destroy
    redirect_to wikis_path
  end

  private

  # def set_project
  #   @project = Project.find(params[:project_id])
  # end

  def wiki_params
    params.require(:wiki).permit(:description, :title)
  end
end
