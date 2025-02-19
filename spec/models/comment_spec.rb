require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:project) { create(:project) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      comment = build(:comment, project: project)
      expect(comment).to be_valid
    end

    it 'is invalid without a content' do
      comment = build(:comment, project: project, content: nil)
      expect(comment).not_to be_valid
      expect(comment.errors[:content]).to include("can't be blank")
    end
  end
end
