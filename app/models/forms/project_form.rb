module Forms
  class ProjectForm
    include ActiveModel::Model
    include ActiveModel::Attributes

    attr_accessor :project, :user

    attribute :name, :string
    attribute :status, :string

    validates :name, presence: true
    validates :status, presence: true, if: -> { project.new_record? }
    validates :status, inclusion: { in: StatusChange::STATUSES }, allow_blank: true

    def initialize(project, user, params = {})
      @project = project
      @user = user

      super(params)
    end

    def save
      return false unless valid?

      ActiveRecord::Base.transaction do
        project.assign_attributes(
          user: user,
          name: name
        )
        project.save!

        if status_changed?
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

    def status_changed?
      status.present? && project.status != status
    end
  end
end
