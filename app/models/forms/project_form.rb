module Forms
  class ProjectForm
    include ActiveModel::Model

    attr_accessor :project, :user, :name, :status

    validates :name, presence: true
    validates :status, presence: true

    def initialize(project, user, params = {})
      @project = project
      @user = user

      @name = params[:name] || project.name
      @status = params[:status]
    end

    def save
      return false unless valid?

      ActiveRecord::Base.transaction do
        project.assign_attributes(
          user: user,
          name: name
        )
        project.save!

        if status.present?
          project.status_changes.create!(
            user: user,
            status: status
          )
        end
      end

      true
    rescue ActiveRecord::RecordInvalid
      false
    end
  end
end
