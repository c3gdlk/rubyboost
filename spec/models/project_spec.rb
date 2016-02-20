require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should validate_presence_of :title }
  it { should validate_length_of(:title).is_at_most(20) }

  describe '#recent' do
    let(:project_1) { create :project }
    let(:project_2) { create :project }

    it 'should order projects by created_at DESC' do
      expect(Project.recent).to match_array [project_2, project_1]
    end
  end
end
