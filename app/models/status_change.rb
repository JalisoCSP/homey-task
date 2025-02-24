class StatusChange < ApplicationRecord
  belongs_to :project
  belongs_to :user

  STATUSES = %w[draft in_progress completed on_hold cancelled].freeze

  enum :status, STATUSES.index_by(&:itself)

  def to_s
    status.humanize
  end
end
