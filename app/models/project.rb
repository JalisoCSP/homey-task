class Project < ApplicationRecord
  STATUSES = %w[draft in_progress completed on_hold cancelled].freeze

  has_many :comments, dependent: :destroy
  has_many :status_changes, dependent: :destroy

  validates :name, presence: true
  validates :status, inclusion: { in: STATUSES }
end
