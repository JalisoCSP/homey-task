require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      project = build(:project)
      expect(project).to be_valid
    end

    it 'is invalid without a name' do
      project = build(:project, name: nil)
      expect(project).not_to be_valid
      expect(project.errors[:name]).to include("can't be blank")
    end
  end
end
