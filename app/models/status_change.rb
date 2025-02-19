class StatusChange < ApplicationRecord
  belongs_to :project
  belongs_to :user

  enum :status, Project::STATUSES.index_by(&:itself)
end
