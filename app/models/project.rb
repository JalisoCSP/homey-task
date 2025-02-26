class Project < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy

  has_many :status_changes, dependent: :destroy
  has_one :current_status, -> { order(created_at: :desc) }, class_name: "StatusChange"

  delegate :status, to: :current_status, allow_nil: true

  validates :name, presence: true

  def form_attributes
    {
      name: name,
      status: status
    }
  end
end
