class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:show, :index]

  def index
    @projects = Project.all
  end

  def show; end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash["notice"] = "Project was successfully created."
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @project.update(project_params)
      flash["notice"] = "Project was successfully updated."
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    if @project.destroy
      flash["notice"] = "Project was successfully destroyed."
      redirect_to projects_path
    else
      flash["notice"] = "Project was not destroyed."
      render project_path
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
