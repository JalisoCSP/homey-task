class Project < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy

  has_many :status_changes, dependent: :destroy
  has_one :status, -> { order(created_at: :desc) }, class_name: "StatusChange"

  accepts_nested_attributes_for :status_changes

  validates :name, presence: true
end
