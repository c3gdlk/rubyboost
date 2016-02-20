require 'rails_helper'

RSpec.describe 'Projects Page', type: :feature do

  describe 'Index Page' do
    let!(:project) { create :project }

    before { visit projects_path }

    it 'should display project title' do
      expect(page).to have_content project.title
    end

    it 'should display project title' do
      expect(page).to have_content project.title
    end
  end
end
