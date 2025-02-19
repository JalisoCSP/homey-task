require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:user) do
    create(:user)
  end

  let(:project) do
    create(:project)
  end

  before do
    sign_in(user)
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    context 'when the project exists' do
      it 'returns a success response' do
        get :show, params: { id: project.id }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the project does not exist' do
      it 'returns a 404' do
        get :show, params: { id: 99999 }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new project' do
        expect do
          post :create, params: { project: attributes_for(:project) }
        end.to change(Project, :count).by(1)
      end

      it 'returns a success response' do
        post :create, params: { project: attributes_for(:project) }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid attributes' do
      it 'does not create an project' do
        expect do
          post :create, params: { project: attributes_for(:project, name: nil) }
        end.not_to change(Project, :count)
      end

      it 'returns an unprocessable entity response' do
        post :create, params: { project: attributes_for(:project, name: nil) }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH #update' do
    context 'when the project exists' do
      it 'updates the project' do
        patch :update, params: { id: project.id, project: { name: 'Updated Name' } }
        project.reload
        expect(project.name).to eq('Updated Name')
      end

      it 'returns a success response' do
        patch :update, params: { id: project.id, project: { name: 'Updated Name' } }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the project does not exist' do
      it 'returns a 404' do
        patch :update, params: { id: 99999, project: { name: 'Updated Name' } }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when the project exists' do
      it 'deletes the project' do
        expect do
          delete :destroy, params: { id: project.id }
        end.to change(Project, :count).by(-1)
      end

      it 'returns a success response' do
        delete :destroy, params: { id: project.id }
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when the project does not exist' do
      it 'returns a 404' do
        delete :destroy, params: { id: 99999 }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
