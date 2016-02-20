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

  describe 'Create project' do
    before { visit projects_path }
    before { click_on 'New project' }

    specify do
      within "form#new_project" do
        fill_in 'Title', with: 'Test title'
        attach_file('Picture', "#{Rails.root}/spec/fixtures/pixel.png")

        click_on 'Save'
      end

      expect(current_path).to eq projects_path
      expect(page).to have_content 'Test title'
    end
  end

  describe 'Update project' do
    let!(:project) { create :project, title: 'Initial title' }

    before { visit projects_path }
    before { click_on 'Edit' }

    specify do
      within "form#edit_project_#{project.id}" do
        fill_in 'Title', with: 'Test title'

        click_on 'Save'
      end

      expect(current_path).to eq projects_path
      expect(page).to have_content 'Test title'
      expect(page).to_not have_content 'Initial title'
    end
  end

  describe 'Destroy project' do
    let!(:project) { create :project, title: 'Initial title' }

    before { visit projects_path }
    before { click_on 'Delete' }

    specify do
      expect(current_path).to eq projects_path
      expect(page).to have_content 'No projects'
      expect(page).to_not have_content 'Initial title'
    end
  end
end
