require 'rails_helper'

RSpec.describe Users::ProjectsController, type: :controller do
  # describe '#index' do
  #   let!(:project) { create :project }
  #
  #   before { get :index }
  #
  #   specify do
  #     expect(assigns(:projects)).to match_array [project]
  #   end
  # end
  #
  # describe '#new' do
  #   before { get :new }
  #
  #   specify do
  #     expect(assigns(:project)).to be_an_instance_of Project
  #   end
  # end
  #
  # describe '#create' do
  #   context 'when success' do
  #     let(:params) { { title: 'Test project', picture: fixture_file_upload("pixel.png", "image/png") } }
  #
  #     before { post :create, project: params }
  #
  #     it 'should redirect to projects list' do
  #       expect(response).to redirect_to projects_path
  #     end
  #   end
  #
  #   context 'when failure' do
  #     let(:params) { { title: 'Test project' * 10 } }
  #
  #     before { post :create, project: params }
  #
  #     it 'should render form with invalid data' do
  #       expect(assigns(:project)).to be_an_instance_of Project
  #       expect(response).to render_template :new
  #     end
  #   end
  # end
  #
  # describe '#edit' do
  #   let(:project) { create :project }
  #
  #   before { get :edit, id: project.id }
  #
  #   specify do
  #     expect(assigns(:project)).to eq project
  #   end
  # end
  #
  # describe '#update' do
  #   let!(:project) { create :project, title: 'Initial title' }
  #
  #   context 'when success' do
  #     let(:params) { { title: 'Test project' } }
  #
  #     before { put :update, id: project.id, project: params }
  #
  #     it 'should update record and redirect to projects list' do
  #       expect(project.reload.title).to eq 'Test project'
  #       expect(response).to redirect_to projects_path
  #     end
  #   end
  #
  #   context 'when failure' do
  #     let(:params) { { title: 'Test project' * 20 } }
  #
  #     before { put :update, id: project.id, project: params }
  #
  #     it 'should render form with invalid data' do
  #       expect(assigns(:project)).to be_an_instance_of Project
  #       expect(project.reload.title).to eq 'Initial title'
  #       expect(response).to render_template :edit
  #     end
  #   end
  # end
  #
  # describe '#destroy' do
  #   let!(:project) { create :project }
  #
  #   it 'should destroy record' do
  #     expect { delete :destroy, id: project.id }.to change { Project.count }.by(-1)
  #     expect(response).to redirect_to projects_path
  #   end
  # end
end
