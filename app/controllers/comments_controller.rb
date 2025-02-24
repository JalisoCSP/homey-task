class CommentsController < ApplicationController
  before_action :set_project

  # Turbo streams to add these to the page or show errors
  def create
    @comment = @project.comments.new(comment_params.merge(user: current_user))

    if @comment.save
      redirect_to @project, notice: "Comment added successfully."
    else
      redirect_to @project, alert: "Error adding comment."
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
      .with_defaults(user: current_user)
  end
end
