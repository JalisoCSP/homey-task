class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  def index
    @projects = Project.order(created_at: :desc)
  end

  def show
  end

  def new
    @project = Project.new
    @project_form = Forms::ProjectForm.new(@project, current_user)
  end

  def create
    @project = Project.new
    @project_form = Forms::ProjectForm.new(@project, current_user, project_params)

    if @project_form.save
      redirect_to @project, notice: "Project created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project_form = Forms::ProjectForm.new(@project, current_user, @project.form_attributes)
  end

  def update
    @project_form = Forms::ProjectForm.new(@project, current_user, project_params)

    if @project_form.save
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
    params.require(:forms_project_form).permit(:name, :status)
  end
end
