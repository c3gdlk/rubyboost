require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  describe '#index' do
    let!(:project) { create :project }

    before { get :index }

    specify do
      expect(assigns(:projects)).to match_array [project]
    end
  end
end
