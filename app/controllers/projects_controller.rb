class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  def index
    @projects = Project.order(created_at: :desc)
  end

  def show
  end

  def new
    @project = Project.new
    @form = Forms::ProjectForm.new(@project, current_user)
  end

  def create
    @project = Project.new
    @form = Forms::ProjectForm.new(@project, current_user, project_params)

    if @form.save
      redirect_to @project, notice: "Project created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @form = Forms::ProjectForm.new(@project, current_user)
  end

  def update
    @form = Forms::ProjectForm.new(@project, current_user, project_params)

    if @form.save
      redirect_to @project, notice: "Project updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: "Project deleted successfully."
  end

  private

  def set_project
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to projects_path, alert: "Project not found."
  end

  def project_params
    params.require(:project).permit(:name, :status)
      .with_defaults(user: current_user)
  end
end
