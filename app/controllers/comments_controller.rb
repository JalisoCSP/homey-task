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

  def destroy
    @comment = @project.comments.find(params[:id])

    # Could use pundit: authorize(@comment)
    if @comment.user == current_user
      @comment.destroy
      redirect_to @project, notice: "Comment deleted."
    else
      redirect_to @project, alert: "You can only delete your own comments."
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
